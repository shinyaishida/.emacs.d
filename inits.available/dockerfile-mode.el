(use-package dockerfile-mode
  :defer t
  :mode (("Dockerfile\\'" . dockerfile-mode)
         ("Dockerfile.*\\'" . dockerfile-mode)))

(autoload 'dockerfile-mode "dockerfile-mode" nil t)
