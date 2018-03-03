(use-package js2-mode
  :ensure t
  :defer t
  :mode (("\\.js$" . js2-mode)
         ("\\.jsx$" . js2-jsx-mode))
  :config
  (setq js2-basic-offset 2))
