; don't display startup message
(setq inhibit-startup-message t)

; no scrollbar
(scroll-bar-mode -1)

; no toolbar
(tool-bar-mode -1)

; blink-cursor
(blink-cursor-mode t)

; highlight current line
(global-hl-line-mode t)

; theme
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(load-file "~/.emacs.d/vendor/twilight-emacs/color-theme-twilight.el")
(color-theme-twilight)

; colors
(custom-set-faces
  '(flymake-errline ((t :underline "red")))
  '(flymake-warnline ((t :underline "green"))))

; Default font is Deja Vu Sans Mono, 18pt.
(if (string-equal system-type "gnu/linux")
  (set-default-font "-unknown-DejaVu Sans Mono-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1")
  (set-default-font "-apple-deja vu sans mono-medium-r-normal--18-140-72-72-m-140-iso10646-1"))


