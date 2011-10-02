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
         ("Ombudsman"
          (filename . "Development/Banksimple/ombudsman"))
         ("Goalkeeper"
          (filename . "Development/Banksimple/goalkeeper"))
         ("BankSimple dev"
          (filename . "Development/Banksimple"))
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




