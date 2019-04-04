(local tiled (require "lib.tiled"))
(local bump (require "lib.bump"))

(local map (tiled "map.lua" ["box2d"]))
(local world (bump.newWorld))
(local falcon (love.graphics.newImage "assets/falcon.png"))
(global xyz (require :text))

(: map :box2d_init world)

(var counter 0)
(var time 0)
(var joo true)
(local speed 10)
(local coord {:x 0 :y 200})

(local player1 {:theta 0 :x 50 :y 50 :steer 0})

{:draw (fn draw [message]
         (let [{:x y :y y} coord]
           (: map :draw 0 0)
           (xyz.outline "KAKKA!!!" 100 100)
           (when joo
             (love.graphics.print (string.format "theta: %f steer: %f" player1.theta player1.steer) 1 1)
             (love.graphics.draw falcon player1.x player1.y player1.theta 1 1 8 8))))
 
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
           true)
 :keypressed (fn keypressed [key set-mode]
               (if (= key "k")
                   (set joo (not joo))))} 
