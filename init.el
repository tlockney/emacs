; marmalade
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
      (package-refresh-contents))

(defvar my-packages `(caml
                      clojure-mode
                      coffee-mode
                      haskell-mode
                      ipython
                      magit
                      markdown-mode
                      python
                      python-mode
                      rvm
                      slime
                      slime-clj
                      slime-repl
                      tuareg
                      virtualenv))
(dolist (p my-packages)
        (when (not (package-installed-p p))
              (package-install p)))

(push "/usr/local/bin" exec-path)
(push "~/bin" exec-path)

; add to load path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/utilities")
(add-to-list 'load-path "~/.emacs.d/vendor")

(load-file "~/.emacs.d/load-directory.el")

(mapcar 'load-directory '("~/.emacs.d/utilities"))

(vendor 'color-theme)
(vendor 'color-theme-solarized)
(vendor 'gambit)
(vendor 'full-ack)

(add-to-list 'load-path "~/.emacs.d/vendor/scala")
(add-to-list 'load-path "~/.emacs.d/vendor/ensime")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")

(mapcar 'load-directory '("~/.emacs.d/customizations"))

(if (string-equal system-type "gnu/linux")
    (mapcar 'load-directory '("~/.emacs.d/linux-customizations"))
    (mapcar 'load-directory '("~/.emacs.d/mac-customizations")))
