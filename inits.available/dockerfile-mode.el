(use-package dockerfile-mode
  :ensure t
  :defer t
  :mode (("Dockerfile\\'" . dockerfile-mode)
         ("Dockerfile.*\\'" . dockerfile-mode)))

(autoload 'dockerfile-mode "dockerfile-mode" nil t)
