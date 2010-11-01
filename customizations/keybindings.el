; open file
(global-set-key [(super o)] 'find-file)

; close window
(global-set-key [(super w)]
                (lambda ()
                  (interactive)
                  (kill-buffer (current-buffer))))

; navigate through errors
(global-set-key [(meta n)] 'next-error)
(global-set-key [(meta p)] 'previous-error)

