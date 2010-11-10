;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(push "/usr/local/bin" exec-path)

; add to load path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/utilities")
(add-to-list 'load-path "~/.emacs.d/vendor")

(load-file "~/.emacs.d/load-directory.el")

(mapcar 'load-directory '("~/.emacs.d/utilities"))

(vendor 'color-theme)

(add-to-list 'load-path "~/.emacs.d/vendor/scala")

(mapcar 'load-directory '("~/.emacs.d/customizations"))

(if (string-equal system-type "gnu/linux")
    (mapcar 'load-directory '("~/.emacs.d/linux-customizations"))
    (mapcar 'load-directory '("~/.emacs.d/mac-customizations")))

(eshell)
