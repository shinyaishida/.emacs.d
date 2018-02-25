(auto-package-install '(feature-mode))

(use-package feature-mode
  :defer t
  :mode (("\.feature$" . feature-mode)))
