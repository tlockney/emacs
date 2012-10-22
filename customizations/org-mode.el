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
      '(
        ("t" "Todo" entry (file+datetree "~/Dropbox/org/todo.org" "Tasks")
         "* TODO %^{Description}\n%?\n")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
         "* %?\n  Entered on %U\n  %i\n  %a")
       )
)

(defadvice org-capture-finalize (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame if it is the capture frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame))
)

(defadvice org-capture-destroy (after delete-capture-frame activate)
  "Advise capture-destroy to close the frame if it is the capture frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame))
)

(defadvice org-switch-to-buffer-other-window (after delete-other-none-org-window activate)
  "Advise org-switch-to-buffer-other-window to close other windows after creation"
  (message "testing")
  (switch-to-buffer buffer)
)

(defadvice org-protocol-check-filename-for-protocol (around tp/org-protocol-make-frame activate)
 "Advice org-protocol-check-filename-for-protocol to open windows in new frames."
 (flet ((org-switch-to-buffer-other-window (&rest args) ; for org-mks
           (let ((pop-up-frames t))
             (apply 'switch-to-buffer-other-window args)))
        (org-pop-to-buffer-same-window (&rest args)  ; for org-capture
           (let ((pop-up-frames t))
             (apply 'switch-to-buffer-other-window args))))
   (let ((display-buffer-mark-dedicated t))
     ad-do-it)))

(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "Orgmode Capture")
                (width . 100)
                (height . 15)))
  (select-frame-by-name "Orgmode Capture")
  (org-capture)
)

; babel config
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (haskell . t)
   (gnuplot . t)
   (js . t)
   (java . t)
   (lisp . t)
   (ocaml . t)
   (python . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (clojure . t)
   ))

(defvar org-journal-file "~/Dropbox/org/journal.org"
  "Path to OrgMode journal file.")
(defvar org-journal-date-format "%Y-%m-%d"
  "Date format string for journal headings.")

(defun org-journal-entry()
  "Create a new diary entry for today or append to an existing one."
  (interactive)
  (switch-to-buffer (find-file org-journal-file))
  (widen)
;  (let ((today (format-time-string org-journal-date-format)))
  (let ((i-search-forward t)(today (format-time-string org-journal-date-format)))
    (beginning-of-buffer)
    (unless (org-goto-local-search-headings today nil t)
            ((lambda ()
               (org-insert-heading)
               (insert today)
               (insert "\n\n \n"))))
    (beginning-of-buffer)
    (org-show-entry)
    (org-narrow-to-subtree)
    (end-of-buffer)
    (backward-char 2)
    (unless (= (current-column) 2)
            (insert "\n\n "))))
