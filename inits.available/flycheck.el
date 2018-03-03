(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (setq flycheck-checker 'ruby-rubocop)
               (flycheck-mode 1)))
  (add-hook 'js2-jsx-mode-hook
            '(lambda ()
               (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
               (flycheck-mode 1))))
