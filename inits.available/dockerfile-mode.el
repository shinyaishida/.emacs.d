(auto-package-install '(dockerfile-mode))

(autoload 'dockerfile-mode "dockerfile-mode" nil t)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(add-to-list 'auto-mode-alist '("Dockerfile.*\\'" . dockerfile-mode))
