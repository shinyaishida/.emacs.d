(auto-package-install '(magit))

(add-to-list 'load-path (local-path-to "magit"))
(use-package magit
  :bind (("C-c g" . magit-status)))
