; tabs
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

; mousing
(setq mac-emulate-three-button-mouse nil)
; (pc-selection-mode t)

; encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

; whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; show column number in bar
(column-number-mode t)

; highlight matching parens
(show-paren-mode t)

; highlight incremental search
(defconst search-highlight t)


