;; Loading TypeRex mode for OCaml files
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . typerex-mode))
(autoload 'typerex-mode "typerex" "Major mode for editing Caml code" t)

;; TypeRex mode configuration
(setq ocp-server-command "/usr/local/bin/ocp-wizard")
(setq typerex-in-indent 0)
(setq-default indent-tabs-mode nil)

;; Uncomment to enable typerex command menu by right click
;;(setq ocp-menu-trigger [mouse-3])

;; Uncomment make new syntax coloring look almost like Tuareg
;;(setq ocp-theme "tuareg_like")
;; Uncomment to disable new syntax coloring and use Tuareg
;;(setq ocp-syntax-coloring nil)

;;;; Auto completion (experimental)
;;;; Don't use M-x invert-face default with auto-complete! (emacs -r is OK)
;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/auto-complete-mode")
;;(setq ocp-auto-complete t)

;;;; Using <`> to complete whatever the context, and <C-`> for `
;;(setq auto-complete-keys 'ac-keys-backquote-backslash)
;;;; Options: nil (default), 'ac-keys-default-start-with-c-tab, 'ac-keys-two-dollar
;;;; Note: this overrides individual auto-complete key settings

;;;; I want immediate menu pop-up
;;(setq ac-auto-show-menu 0.)
;;;; Short delay before showing help
;;(setq ac-quick-help-delay 0.3)
;;;; Number of characters required to start (nil to disable)
;;(setq ac-auto-start 0)

;;;; Uncomment to enable auto complete mode globally (independently of OCaml)
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "/usr/local/share/emacs/site-lisp/auto-complete-mode/ac-dict")
;;(ac-config-default)

;; For debugging only
(setq ocp-debug t)
;;;;(setq ocp-profile t)
;;;;(setq ocp-dont-catch-errors t)
