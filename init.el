; marmalade
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(push "/usr/local/bin" exec-path)

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

(mapcar 'load-directory '("~/.emacs.d/customizations"))

(if (string-equal system-type "gnu/linux")
    (mapcar 'load-directory '("~/.emacs.d/linux-customizations"))
    (mapcar 'load-directory '("~/.emacs.d/mac-customizations")))
