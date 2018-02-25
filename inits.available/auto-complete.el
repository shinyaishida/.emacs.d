(use-package auto-complete-config
  :ensure auto-complete
  :demand t
  :bind (:map ac-menu-map
              ("C-n" . ac-next)
              ("C-p" . ac-previous))
  :config
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case 'smart)
  (setq ac-dwim t)
  (global-auto-complete-mode t)

  (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols t)))

  ;; ; Use helm to narrow candidates.
  ;; (require 'ac-helm)
  ;; (define-key ac-complete-mode-map (kbd "C-;") 'ac-complete-with-helm)

  ;; ; Avoid errors raised by yasnippet
  ;; (setf (symbol-function 'yas-active-keys)
  ;;       ((lambda ()
  ;;          (remove-duplicates (mapcan #'yas-table-all-keys (yas--get-snippet-tables))))))
  )
