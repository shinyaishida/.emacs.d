(use-package lua-mode
  :ensure t
  :mode (("\\.lua$" . lua-mode))
  :config
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  (setq lua-indent-level 2))
