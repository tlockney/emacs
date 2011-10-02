;; org mode stuff
(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-directory "~/Dropbox/org")
(setq org-agenda-files '("~/Dropbox/org/"))
(setq org-mobile-directory "~/Dropbox/MobileOrg")

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)

(add-hook 'org-mode-hook 'turn-on-font-lock)

(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+datetree "~/Dropbox/org/todo.org" "Tasks")
         "* TODO %^{Description}\n%?\n")
        ("b" "BankSimple Todo" entry (file+datetree "~/Dropbox/org/todo.org" "BankSimple Tasks")
         "* TODO %^{Description}\n%?\n")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
         "* %?\n  Entered on %U\n  %i\n  %a")
        )
)
