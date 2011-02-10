Common Lisp bindings for libkeybinder
=====================================

License - GPL v2
Original library at http://kaizer.se/wiki/keybinder/


Usage
-----

    (let ((output *standard-output*))
      (gtk:within-main-loop
        (keybinder:init)
        (keybinder:bind
         "<Super>grave"
         (lambda (keystring)
           (format output "~A" keystring)))))
    
