; Rebind "C-x C-c" to disable the default key binding for exiting emacs.
(global-set-key (kbd "C-x C-c") 'helm-M-x)
; Rebind "C-x C-z" to disable the default key binding for suspending emacs.
;(global-set-key (kbd "C-x C-z") 'something-you-want)
; Use "M-x bye" or "M-x exit" instead to exit emacs.
(defalias 'bye 'save-buffers-kill-emacs)
(defalias 'exit 'save-buffers-kill-emacs)


; for queries on emacs
(define-prefix-command 'my-emacs-query-map)
(global-set-key (kbd "C-q") 'my-emacs-query-map)
(global-set-key (kbd "C-q b") 'describe-bindings)
(global-set-key (kbd "C-q c") 'describe-key-briefly)
(global-set-key (kbd "C-q f") 'describe-function)
(global-set-key (kbd "C-q i") 'info)
(global-set-key (kbd "C-q k") 'describe-key)
(global-set-key (kbd "C-q m") 'describe-mode)
(global-set-key (kbd "C-q s") 'describe-syntax)
(global-set-key (kbd "C-q v") 'describe-variable)

(global-set-key (kbd "C-c C-f") 'load-file)
(global-set-key (kbd "C-c C-e") 'eval-region)


; for editorial work
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-/") 'undo)
(global-set-key (kbd "C-\\") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-d") 'delete-word)
(global-set-key (kbd "C-.") 'delete-word) ; alias for emacs on console
(global-set-key (kbd "C-S-h") 'delete-word-backward)
(global-set-key (kbd "C-,") 'delete-word-backward) ; alias for emacs on console

(global-set-key (kbd "C-c C-l") 'goto-line)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)


; for entering a mode
(global-set-key (kbd "C-c e") 'emacs-lisp-mode)
(global-set-key (kbd "C-c l") 'linum-mode)
(global-set-key (kbd "C-c s") 'shell-script-mode)


;; for functions appended at local site-lisp
(global-set-key (kbd "C-x m") 'helm-mini)
(global-set-key (kbd "C-c g") 'magit-status)


;; for executing compilation
(global-set-key (kbd "C-c c") 'compile)
