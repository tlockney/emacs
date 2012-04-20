;prompts - see http://www.masteringemacs.org/articles/2010/11/14/disabling-prompts-emacs/
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

; tramp
(require 'tramp)
(setq tramp-default-method "scp")

; ido mode stuff
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-enable-tramp-completion nil)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil)
(setq ido-show-dot-for-dired t)
(setq ido-file-extensions-order
      '(".org" ".txt" ".scala" ".rb" ".py" ".el" ".cfg"))

;(desktop-save-mode 1)

(setq make-backup-files nil) ;; do not make backup files
(setq auto-save-default nil) ;; do not auto-save!

; iBuffer config
(setq ibuffer-display-summary nil)
(setq ibuffer-saved-filter-groups
      '(("default"
         ("Org"
          (mode . org-mode))
         ("Development"
          (filename . "Development"))
         ("Help" (or (name . "\*Help\*")
                     (name . "\*Apropos\*")
                     (name . "\*info\*")))
         )))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))
(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)

; open quick frame for one-off stuff
(defun make-quick-frame ()
  "Creates a new frame intended to be triggered by an external emacsclient command."
  (make-frame '((name . "Quickie")
                (width . 100)
                (height . 30)))
  (select-frame-by-name "Quickie")
  (switch-to-buffer "Quickie"))
