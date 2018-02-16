(auto-package-install '(helm))

(add-to-list 'load-path (local-path-to "helm"))
(require 'helm-config)

; Let helm complete command typing.
(helm-mode 1)

; Disable the automatic completion by helm and use tab-completion instead.
(custom-set-variables '(helm-ff-auto-update-initial-value nil))

; Rebind "C-x C-c" to disable the default key binding for exiting emacs.
(global-set-key (kbd "C-x C-c") 'helm-M-x)
; Use "M-x bye" or "M-x exit" instead to exit emacs.
(defalias 'bye 'save-buffers-kill-emacs)
(defalias 'exit 'save-buffers-kill-emacs)

(global-set-key (kbd "C-x m") 'helm-mini)

; Enable backspace by C-h in helm.
;(define-key helm-map (kbd "C-a") 'move-beginning-of-line)
(define-key helm-map (kbd "C-S-d") 'delete-word)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-S-h") 'delete-word-backward)
(define-key helm-map (kbd "C-k") 'kill-line)
(define-key helm-map (kbd "C-r") 'isearch-backward)
(define-key helm-map (kbd "C-s") 'isearch-forward)
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)

; Reduce the idle delays of helm.
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)

; Customize helm-completing-read-handlers-alist.
;
; helm works for all by default.  It is useful to look for something with
; keywords.  However, it is annoying if you know the exact name or phrase, or
; if the function completes it by hitting tab.  Disable helm in those cases.
(add-to-list 'helm-completing-read-handlers-alist '(load-file))
(add-to-list 'helm-completing-read-handlers-alist '(find-file))
(add-to-list 'helm-completing-read-handlers-alist '(switch-to-buffer))
(add-to-list 'helm-completing-read-handlers-alist '(kill-buffer))
(add-to-list 'helm-completing-read-handlers-alist '(gtags-find-tag))
(add-to-list 'helm-completing-read-handlers-alist '(gtags-find-rtag))
;(add-to-list 'helm-completing-read-handlers-alist '(gtags-find-symbol))
