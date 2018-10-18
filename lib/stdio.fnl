(require "love.event")
(local view (require "lib.fennelview"))

;; This module exists in order to expose stdio over a channel so that it
;; can be used in a non-blocking way from another thread.

(local (event channel) ...)

(when channel
  (let [prompt (fn [] (io.write "> ") (io.flush) (io.read "*l"))]
    ((fn looper [input]
       (when input
         ;; This is consumed by love.handlers[event]
         (love.event.push event input)
         (print (: channel :demand))
         (looper (prompt)))) (prompt))))

{:start (fn start-repl []
          (let [code (love.filesystem.read "stdio.fnl")
                lua (if code
                        (love.filesystem.newFileData
                         (fennel.compileString code) "io")
                        (love.filesystem.read "lib/stdio.lua"))
                thread (love.thread.newThread lua)
                io-channel (love.thread.newChannel)]
            ;; this thread will send "eval" events for us to consume:
            (: thread :start "eval" io-channel)
            (set love.handlers.eval
                 (fn [input]
                   (let [(ok val) (pcall fennel.eval input)]
                     (: io-channel :push (if ok (view val) val)))))))}
