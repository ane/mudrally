-- https://love2d.org/wiki/General_math
return function(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y)
   local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
   local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
   local det,x,y = a1*b2 - a2*b1
   if det==0 then return false, "The lines are parallel." end
   x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
   if not (math.min(l1p1x,l1p2x) <= x and x <= math.max(l1p1x,l1p2x) and
              math.min(l1p1y,l1p2y) <= y and y <= math.max(l1p1y,l1p2y)) or
      not (math.min(l2p1x,l2p2x) <= x and x <= math.max(l2p1x,l2p2x) and
           math.min(l2p1y,l2p2y) <= y and y <= math.max(l2p1y,l2p2y)) then
         return false, "The lines don't intersect."
   end
   return x,y
end
