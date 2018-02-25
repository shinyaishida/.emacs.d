(use-package apples-mode
  :ensure t
  :defer t
  :if (eq system-type 'darwin)
  :mode (("\\.scpt$" . applescript-mode)))
