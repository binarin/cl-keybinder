(in-package :keybinder)

(define-foreign-library libkeybinder
  (t (:default "libkeybinder")))

(use-foreign-library libkeybinder)

(defcfun ("keybinder_init" init) :void)

(defcallback keybinder-handler :void ((keystring :string)
                                      (user-data :pointer))
  (gtk:with-gtk-message-error-handler
    (funcall (gobject:stable-pointer-value user-data)
             keystring)))

(defcfun ("keybinder_bind" keybinder_bind) :boolean
  (keystring :string)
  (handler :pointer)
  (user-data :pointer))

(defun bind (keystring handler)
  (keybinder_bind keystring
                  (callback keybinder-handler)
                  (gobject:allocate-stable-pointer handler)))

(defcfun (keybinder_unbind keybinder_unbind) :void
  (keystring :string)
  (handler :pointer))

(defun unbind (keystring)
  (keybinder_unbind keystring (callback keybinder-handler)))
