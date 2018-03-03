;; Consult for the meaning of the word under cursor
(global-set-key (kbd "C-c w o")
                (lambda () (interactive)
                  (let ((url (concat "dict://" (current-word)))
                        (browse-url-browser-function 'browse-url-default-browser))
                    (browse-url url))))

(global-set-key (kbd "C-c w s")
                (lambda (key) (interactive "MConsult Dictionary for the meaning of: ")
                  (let ((url (concat "dict://" key))
                        (browse-url-browser-function 'browse-url-default-browser))
                    (browse-url url))))
