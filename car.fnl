(local bf (require "breezefield"))
(local phy love.physics)

(local dirts {})
(global max-lateral-force 3)
(global max-forward-force (* max-lateral-force 100))

(fn new-chassis [world image x y w h mass]
  (let [chassis (bf.Collider.new world "Rectangle" x y w h)]
    (: chassis.body :setMass mass)
    (: chassis.body :setLinearDamping 3)
    {:image image
     :body chassis.body}))

(fn new-tire [world mass x y w h]
  (let [body (phy.newBody world._world x y "dynamic")
        shape (phy.newRectangleShape w h)
        fixt (phy.newFixture body shape 1)]
    (: body :setMass mass)
    (: body :setLinearDamping 1)
    {:body body
     :shape shape
     :width w
     :height h
     :mass mass}))

(fn attach-tire [chassis tire cx cy tx ty]
  (let [joint (love.physics.newRevoluteJoint tire.body chassis.body cx cy)]
    (: joint :setLimits 0 0)
    (: joint :setLimitsEnabled true)
    (tset tire :joint joint)))

(fn new [world image x y w h mass]
  (let [chassis   (new-chassis world image x y w h mass)
        tire-mass (/ mass 2)

        xoffs (/ w 4)
        yoffs (- (/ h 2) 1)
        
        tire-width 3
        tire-height 2
        
        fl      (new-tire world tire-mass (+ x xoffs) (- y yoffs) tire-width tire-height)
        fr      (new-tire world tire-mass (+ x xoffs) (+ y yoffs) tire-width tire-height)
        rl      (new-tire world tire-mass (- x xoffs) (- y yoffs) tire-width tire-height)
        rr      (new-tire world tire-mass (- x xoffs) (+ y yoffs) tire-width tire-height)]
    (attach-tire chassis fl (+ x xoffs) (- y yoffs))
    (attach-tire chassis fr (+ x xoffs) (+ y yoffs))
    (attach-tire chassis rl (- x xoffs) (- y yoffs))
    (attach-tire chassis rr (- x xoffs) (+ y yoffs))
    {:chassis chassis
     :sprite image
     :width w
     :height h
     :fl fl
     :fr fr
     :rl rl
     :rr rr}))

(global scalar
        (fn scalar [s x y]
          (values (* s x) (* s y))))

(fn eject-dirt [origin vx vy terrain]
  (let [world (: origin :getWorld)
        (ox oy) (: origin :getWorldCenter)
        point (love.physics.newRectangleShape 1 1)
        body (love.physics.newBody world ox oy "dynamic")
        fixt (love.physics.newFixture body point 1)]
    
    (: fixt :setSensor true)
    (when (< 0.25 (love.math.random))
      (let [result {:body body
                    :terrain (terrain ox oy)}]
        (: body :setLinearDamping 5)
        (: body :setMass 0.35)
        (: body :applyLinearImpulse (scalar (love.math.random) vx vy))
        (when (< 1000 (# dirts))
          (let [head (table.remove dirts 1)]
            (: head.body :destroy)))
        (table.insert dirts result)
        result)))
  
  )

(fn dot [x1 y1 x2 y2]
  (+ (* x1 y1) (* x2 y2)))

(fn lateral-velocity [body]
  (let [(wx wy) (: body :getWorldVector 0 1)
        (vx vy) (: body :getLinearVelocity)
        d (dot wx vx wy vy)]
    (scalar d wx wy)))

(fn forward-velocity [body]
  (let [(wx wy) (: body :getWorldVector 1 0)
        (vx vy) (: body :getLinearVelocity)]
    (scalar (dot wx vx wy vy) wx wy)))

(fn neg [x y]
  (values (- 0 x) (- 0 y)))

(fn vec-len [x y]
  (math.sqrt (+ (* x x) (* y y))))

(fn terrain->rgb [terrain]
  (match terrain
    "Rock" (values 0.2 0.2 0.2)
    "Sand" (values 0.96 0.78 0.68)
    "Grass" (values 0.38 0.15 0)
    "Ice" (values 0.9 0.9 1)))

(fn update [car get-friction get-terrain emit]
  (let [{:fl fl :fr fr :rl rl :rr rr} car]
    (each [i tire (pairs [fl fr rl rr])]
      (let [(lx ly) (lateral-velocity tire.body)
            (wx wy) (: tire.body :getWorldCenter)
            (nx ny) (neg lx ly)

            ground-friction (get-friction wx wy)
            mass  tire.mass
            (ix iy) (scalar mass nx ny)
            
            max-lateral (* max-lateral-force ground-friction)
            (rix riy) (if (< max-lateral (vec-len ix iy))
                          (scalar (/ max-lateral (vec-len ix iy)) ix iy)
                          (values ix iy))]
        (when (< 20 (vec-len ix iy))
          (let [terrain (get-terrain wx wy)]
            (emit wx wy 0 (terrain->rgb terrain.name)))
          (eject-dirt tire.body lx ly get-terrain))
        (: tire.body :applyLinearImpulse rix riy)))))

(fn move [car direction speed get-friction]
  (let [{:fl fl :fr fr :rl rl :rr rr} car]
    (each [_ tire (pairs [fl fr])]
      (let [;; Forward speed
            (fx fy) (forward-velocity tire.body)
            (fnx fny) (: tire.body :getWorldVector 1 0)
            (tx ty) (: tire.body :getWorldCenter)
            friction (get-friction tx ty)
            cur-speed (dot fnx fx fny fy)

            max-speed (* direction 300)
            max-force (* max-forward-force (math.min 1.0 (+ 0.5 friction)))
            force (if (> max-speed cur-speed)
                      max-force
                      (- max-force))
            
            (speed-x speed-y) (scalar force fnx fny)]
        (: tire.body :applyForce speed-x speed-y)))))

(λ clamp [v low high]
  (math.max low (math.min v high)))

(fn unsteer [car]
  (let [{:fl fl :fr fr} car]
    (each [_ tire (pairs [fl fr])]
      (let [{:joint joint} tire]
        (: joint :setLimits 0 0)))))

(fn steer [car direction]
  (let [{:fl fl :fr fr} car]
    (each [_ tire (pairs [fl fr])]
      (let [{:joint joint} tire
            max-angle (math.rad 10)
            desired (* direction max-angle)
            
            current-angle (: joint :getJointAngle)
            to-turn (- desired current-angle)
            result (clamp to-turn -0.05 0.05)
            new-angle (+ current-angle result)
            ]
        (: joint :setLimits new-angle new-angle)))))

(fn draw-body [body r g b mode alpha]
  (let [(pr pg pb) (love.graphics.getColor)]
    (love.graphics.setColor r g b (or alpha 1))
    (each [_ fixture (pairs (: body :getFixtures))]
      (love.graphics.polygon (or mode "line")
                             (: body :getWorldPoints
                                ( -> fixture
                                     (: :getShape)
                                     (: :getPoints)))))
    (love.graphics.setColor pr pg pb)))

(fn draw-physics [car]
  (let [{:fl fl :fr fr :rl rl :rr rr :chassis chassis} car]
    ;; Tires
    (each [_ tire (pairs [fl fr])]
      (draw-body tire.body 1 0 0))
    (each [_ tire (pairs [rl rr])]
      (draw-body tire.body 0 0 0))
    (each [_ tire (pairs [fl fr rl rr])]
      (let [{:joint joint} tire]
        (let [(x1 y1 x2 y2) (: joint :getAnchors)
              (pr pg pb) (love.graphics.getColor)]
          (love.graphics.setColor 1 0 0)
          (love.graphics.points x1 y1 x2 y2)
          (love.graphics.setColor pr pg pb))))))

(fn draw-skid [{:fl fl :fr fr :rr rr :rl rl} canvas terrain]
  (each [_ tire (pairs [fl fr rr rl])]
    (let [(lx ly) (lateral-velocity tire.body)
          vl (vec-len lx ly)
          (tx ty) (: tire.body :getWorldCenter)
          angle (: tire.body :getAngle)
          terr (terrain tx ty)]
      (when (and terr (> vl 10))
        (let [(er eg eb ea) (love.graphics.getColor)
              (r g b) (terrain->rgb terr.name)]
          (love.graphics.setColor r g b)
          (draw-body tire.body r g b "fill" (math.min 0.8 (/ vl 90)))
          (love.graphics.setColor er eg eb ea)))))
  )

(fn draw-dirt [canvas color]
  (love.graphics.clear)
  (each [_ p (pairs dirts)]
    (draw-body p.body (terrain->rgb p.terrain.name))))

(fn draw [car canvas ejecta-canvas terrain]
  (let [{:sprite sprite :chassis chassis :width width :height height} car
        angle (: chassis.body :getAngle)
        (x y) (: chassis.body :getWorldCenter)]
    (: ejecta-canvas :renderTo (lambda [] (draw-dirt canvas)))
    (: canvas :renderTo (lambda [] (draw-skid car canvas terrain)))
    (draw-physics car)
    (love.graphics.draw sprite x y angle 1 1 (/ width 2) (+ height))))

{:new new
 :move move    
 :draw draw
 :draw-physics draw-physics
 :steer steer
 :unsteer unsteer
 :update update}
