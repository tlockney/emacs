(defun make-quick-haskell-frame ()
  "Creates a new frame running haskell-mode."
  (make-frame '((name . "Quick Haskell")
                (width . 120)
                (height . 40)))
  (select-frame-by-name "Quick Haskell")
  (switch-to-buffer "Haskell")
  (haskell-mode))
