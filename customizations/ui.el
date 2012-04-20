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
(setq linum-format " %d ")

; theme
;; (eval-after-load 'color-theme
;;   (progn (color-theme-initialize)
;; 	 (color-theme-charcoal-black)
;; 	 (set-face-background 'region "#555555")))
;; ;(setq color-theme-is-global t)
;; ;(load-file "~/.emacs.d/vendor/twilight-emacs/color-theme-twilight.el")
;; ;(color-theme-twilight)
;;(if window-system (color-theme-solarized-dark))

(require 'color-theme)
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/emacs-color-theme-solarized/")
;; (load-theme 'solarized-dark t)
;; (setq solarized-termcolors 256)
;; (setq solarized-degrade t)


; colors
;; (custom-set-faces
;;   '(flymake-errline ((t :underline "red")))
;;   '(flymake-warnline ((t :underline "green"))))

(defvar after-make-console-frame-hooks '()
"Hooks to run after creating a new TTY frame")
(defvar after-make-window-system-frame-hooks '()
"Hooks to run after creating a new window-system frame")

(defun run-after-make-frame-hooks (frame)
"Selectively run either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
  (select-frame frame)
  (run-hooks (if window-system
               'after-make-window-system-frame-hooks
               'after-make-console-frame-hooks)))

(add-hook 'after-make-frame-functions 'run-after-make-frame-hooks)
(add-hook 'after-init-hook (lambda ()
  (run-after-make-frame-hooks (selected-frame))))

(add-hook 'after-make-window-system-frame-hooks
          '(lambda ()
             ;(color-theme-solarized-dark)
             (load-theme 'solarized-dark t)
             (if (string-equal system-type "gnu/linux")
                 (set-default-font "-unknown-DejaVu Sans Mono-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
                 (set-default-font "-apple-deja vu sans mono-medium-r-normal--14-140-72-72-m-140-iso10646-1"))))

;; (add-hook 'after-make-console-frame-hooks
;;           '(lambda ()
;;              (color-theme-solarized-dark)
;;              ))
