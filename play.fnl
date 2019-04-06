(local tiled (require "lib.tiled"))
(local bump (require "lib.bump"))

(global bf (require "breezefield"))

(local map (tiled "map.lua" ["box2d"]))
(local falcon (love.graphics.newImage "assets/falcon.png"))
(global xyz (require :text))

(var counter 0)
(var time 0)
(var joo true)
(local speed 10)

(global world (bf.newWorld 0 90.81 true))

(: map :box2d_init world._world)

(local player1 {:theta 0 :x 50 :y 50 :steer 0})

;; (: map :box2d_init world._world)
(global ground (bf.Collider.new world "Polygon" [0, 200, 320, 210, 200, 150, 0, 140]))
(: ground :setType "static")
(global ball (bf.Collider.new world "Circle" 50 50 5))
(global b (bf.Collider.new world "Circle" 100 50 5))
(global c (bf.Collider.new world "Circle" 200 50 5))

(: ball :setRestitution 0.8)
(: b :setRestitution 0.8)
(: c :setRestitution 0.8)

{:draw (fn draw [message]
         (: map :draw 0 0)
         ;; (xyz.outline "kakka" 100 100)
         (: world :draw)
         (: map :box2d_draw 0 0 1 1))
 
 :update (fn update [dt set-mode]
           (if (love.keyboard.isDown "right")
               (let [{:steer steer} player1]
                 (when (<= steer 0.04)
                   (set player1.steer (+ steer 0.008)))))
           (if (love.keyboard.isDown "left")
               (let [{:steer steer} player1]
                 (when (>= steer -0.04)
                   (set player1.steer (- steer 0.008)))))
           (when (or (love.keyboard.isDown "up")
                     (love.keyboard.isDown "down"))
             (when (not (or (love.keyboard.isDown "right")
                            (love.keyboard.isDown "left")))
               (set player1.steer
                    (if (< 0.01 (math.abs player1.steer))
                        (+ player1.steer
                           (if (< 0 player1.steer)
                               -0.003
                               0.003))
                        0)))
             (let [{:x x :y y :theta theta :steer steer} player1]
               (set player1.theta
                    (+ theta (if (< 0.03 (math.abs steer))
                                 steer
                                 0)))
               (let [delta (if (love.keyboard.isDown "up") 1 -1)
                     new-x (+ x (* (math.cos theta) 1 delta))
                     new-y (+ y (* (math.sin theta) 1 delta))]
                 (set player1.x new-x)
                 (set player1.y new-y))))
           (: world :update dt)
           true)
 :keypressed (fn keypressed [key set-mode]
               (if (= key "k")
                   (set joo (not joo))))} 
