(use-package json-mode
  :ensure t
  :defer t
  :mode (("\\.json$" . json-mode))
  :config
  (add-hook 'json-mode-hook
            (lambda ()
              (make-local-variable 'js-indent-level)
              (setq js-indent-level 2))))
