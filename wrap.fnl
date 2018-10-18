(local repl (require "lib.stdio"))
(local canvas (love.graphics.newCanvas 720 450))

(var scale 1)

;; set the first mode
(var mode (require "mode-intro"))

(fn set-mode [mode-name ...]
  (set mode (require mode-name))
  (when mode.activate
    (mode.activate ...)))

(fn love.load []
    (: canvas :setFilter "nearest" "nearest")    
    (repl.start))

(fn love.draw []
    (love.graphics.setCanvas canvas)
    (love.graphics.clear)
    (love.graphics.setColor 1 1 1)
    (mode.draw)
    (love.graphics.setCanvas)
    (love.graphics.setColor 1 1 1)
    (love.graphics.draw canvas 0 0 0 scale scale))

(fn love.update[dt]
    (mode.update dt set-mode)
    )

(fn love.keypressed [key]
    (if
     (and (love.keyboard.isDown "lctrl" "rctrl" "capslock") (= key "q"))
     (love.event.quit)
     ;; add what each keypress should do in each mode
     (mode.keypressed key set-mode)
     ))
    
