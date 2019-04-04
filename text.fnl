(fn outline [str x y r g b]
  (love.graphics.setColor 0.0 0.0 0.0)
  (love.graphics.print str (+ x 1) (+ y 1))
  (love.graphics.print str (- x 1) (- y 1))
  (love.graphics.print str (- x 1) (+ y 1))
  (love.graphics.print str (+ x 1) (- y 1))
  (love.graphics.print str (- x 1) y)
  (love.graphics.print str (+ x 1) y)
  (love.graphics.print str x     (+ y 1))
  (love.graphics.print str x     (- y 1))

  (love.graphics.setColor (or r 1) (or g 1) (or b 1))
  (love.graphics.print str x y))

{:outline outline}
