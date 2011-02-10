(defsystem keybinder
  :version "0.1"
  :license "GNU GPL v2"
  :depends-on ("cffi" "cl-gtk2-gtk")
  :components
  ((:file "packages")
   (:file "keybinder" :depends-on ("packages"))))
