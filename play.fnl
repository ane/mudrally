(local tiled (require "lib.tiled"))
(local bump (require "lib.bump"))

(global bf (require "breezefield"))

(global map (tiled "map.lua" ["box2d"]))
(local falcon (love.graphics.newImage "assets/falcon.png"))
(local carm (require "car"))
(global xyz (require :text))

(var counter 0)
(var time 0)
(var joo true)
(local speed 10)

(global world (bf.newWorld 0 0 true))

(: map :box2d_init world._world)

(local dirt-canvas (love.graphics.newCanvas 320 240))
(local ejecta-canvas (love.graphics.newCanvas 320 240))
(local player1 {:theta 0 :x 100 :y 100 :steer 0})

;; (: map :box2d_init world._world)
;; (global ground (bf.Collider.new world "Polygon" [0, 200, 320, 210, 200, 150, 0, 140]))
;; (: ground :setType "static")
(global ball (bf.Collider.new world "Circle" 50 50 5))
(global b (bf.Collider.new world "Circle" 100 50 5))
(global c (bf.Collider.new world "Circle" 200 50 5))
(global car (bf.Collider.new world "Rectangle" player1.x player1.y 16 8))

(global pbuf (love.graphics.newCanvas 1 1))
(: pbuf :renderTo
   (fn []
     (love.graphics.points 0 0)))
(global ps (love.graphics.newParticleSystem pbuf 1000))


(doto ps
  (: :setParticleLifetime 1 15)
  (: :setEmissionRate 5))

(lambda emit-particles [x y angle r g b]
  (doto ps
    (: :setPosition x y)
    (: :setColors r g b 1)
    (: :setDirection angle)
    (: :emit 10)))

(local objs {})
(local joints {})

(global vehicle (carm.new world falcon 30 30 16 8 1))

(: car.body :setAngle 0)
(: car :setRestitution 0)
(: car.body :setMass 1)
(: car.body :setAngularDamping 2)
(: car.body :setInertia 1)
(: car.body :setLinearDamping 1)

(: ball :setRestitution 0.8)
(: b :setRestitution 0.8)
(: c :setRestitution 0.8)

(fn dot [x1 y1 x2 y2]
  (+ (* x1 y1) (* x2 y2)))

(global scalar
        (fn scalar [s x y]
          (values (* s (or x 0)) (* s (or y 0)))))

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

(fn draw-objects []
  (each [_ v (pairs objs)]
    (each [_ f (pairs (: v :getFixtures))]
      (love.graphics.polygon "line"
                             (: v :getWorldPoints 
                                (-> f
                                    (: :getShape)
                                    (: :getPoints)))))))

(fn draw-joints []
  (each [_ v (pairs joints)]
    (let [(x1 y1 x2 y2) (: v :getAnchors)
          (bodyA bodyB) (: v :getBodies)
          (ax1 ay1) (: bodyA :getWorldCenter)
          (bx1 by1) (: bodyB :getWorldCenter)
          rx1 ax1
          ry1 ay1
          rx2 bx1
          ry2 by1]
      (love.graphics.setColor 0 1 1)
      (love.graphics.line rx1 ry1 rx2 ry2)
      (love.graphics.setColor 1 1 0)
      (love.graphics.points (+ x1 rx1) (+ y1 ry1))
      (love.graphics.setColor 1 1 1))))

;; How many n fit inside m
(lambda fit [m n]
  (math.max 0 (math.floor (/ m n))))

(lambda terrain-data [x y]
  (let [(tx ty) (: map :convertPixelToTile x y)
        tix (math.min 16 (math.max 1 (+ 1 (math.floor tx))))
        tiy (math.min 12 (math.max 1 (+ 1 (math.floor ty))))

        ;; tile terrains are divided into four - find out from the remainder
        ;; where we are in the tile
        xmod (math.mod tx 1) 
        ymod (math.mod ty 1)
        xti (math.max 3 (fit xmod 0.25))
        yti (math.max 3 (fit ymod 0.25))
        ground (. map.layers 1)]
    (. ground :data tiy tix :terrain 1)))

(lambda terrain-property [prop x y]
  (. (terrain-data x y) :properties prop))

{:draw (fn draw [message]
         (: map :draw 0 0)
         ;; (: world :draw 1 true)
         ;; (: map :box2d_draw 0 0 1 1)
         (draw-objects)
         (draw-joints)
         
         (love.graphics.draw falcon (: car.body :getX) (: car.body :getY) (: car :getAngle) 1 1 8 8)
         (love.graphics.draw dirt-canvas)
         ;; (love.graphics.draw ejecta-canvas)
         (carm.draw vehicle dirt-canvas ejecta-canvas terrain-data)
         (love.graphics.draw ps 0 0))
 
 :update (fn update [dt set-mode]
           (if (love.keyboard.isDown "d")
               (set player1.steer 1))
           (if (love.keyboard.isDown "a")
               (set player1.steer -1))
           (when (or (love.keyboard.isDown "w")
                     (love.keyboard.isDown "s"))
             (when (not (or (love.keyboard.isDown "d")
                            (love.keyboard.isDown "a")))
               (set player1.steer 0))
             (let [{:x x :y y :theta theta :steer steer} player1
                   angle (: car.body :getAngle)
                   xvec (: car.body :getWorldVector 1 0)
                   (xvel yvel) (: car.body :getLinearVelocity)
                   mass (: car.body :getMass)
                   (lx ly) (lateral-velocity car.body)
                   (fx fy) (forward-velocity car.body)
                   (fnx fny) (: car.body :getWorldVector 1 0)
                   speed (dot fnx fx fny fy)

                   direction (if (love.keyboard.isDown "w") 1 -1)

                   max-speed (* direction 10000)
                   max-force 200
                   force (if (> max-speed speed)
                             max-force
                             (- 0 max-force))

                   (speed-x speed-y) (scalar force fnx fny)

                   max-lateral 2000
                   (nx ny) (neg lx ly)
                   (ix iy) (scalar mass nx ny)
                   (rix riy) (if (< max-lateral (vec-len ix iy))
                                 (scalar (/ max-lateral (vec-len ix iy)) ix iy)
                                 (values ix iy))]
               (: car.body :applyTorque (* player1.steer 5))
               (: car.body :applyForce speed-x speed-y)
               (: car.body :applyLinearImpulse rix riy)))

           (let [get-friction (partial terrain-property :friction)]
             (when (or (love.keyboard.isDown "up")
                       (love.keyboard.isDown "down"))
               (carm.move vehicle (if (love.keyboard.isDown "up") 1 -1) 100 get-friction)
               
               (if (or (love.keyboard.isDown "left")
                       (love.keyboard.isDown "right"))
                   (carm.steer vehicle (if (love.keyboard.isDown "left") 1 -1))

                   (carm.unsteer vehicle)))
             
             (carm.update vehicle get-friction terrain-data emit-particles))
           (: world :update dt)
           (: ps :update dt)
           true)
 
 :keypressed (fn keypressed [key set-mode]
               (if (= key "k")
                   (do
                     (: vehicle.chassis.body :setX 100)
                     (: vehicle.chassis.body :setY 100))))} 
