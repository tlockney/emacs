; don't display startup message
(setq inhibit-startup-message t)

; no scrollbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; no toolbar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

; no menubar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

; blink-cursor
(blink-cursor-mode t)

; highlight current line
(global-hl-line-mode t)

; enable line numbers
(require 'linum)
(global-linum-mode 1)
; optional formatting to make line numbers prettier
(setq linum-format "%d ")

; theme
(require 'color-theme)
(color-theme-initialize)
(eval-after-load 'color-theme
  (progn (color-theme-initialize)
	 (color-theme-charcoal-black)
	 (set-face-background 'region "#555555")))
;(setq color-theme-is-global t)
;(load-file "~/.emacs.d/vendor/twilight-emacs/color-theme-twilight.el")
;(color-theme-twilight)

; colors
(custom-set-faces
  '(flymake-errline ((t :underline "red")))
  '(flymake-warnline ((t :underline "green"))))

; Default font is Deja Vu Sans Mono, 18pt.
(if (string-equal system-type "gnu/linux")
  (set-default-font "-unknown-DejaVu Sans Mono-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  (set-default-font "-apple-deja vu sans mono-medium-r-normal--14-140-72-72-m-140-iso10646-1"))


