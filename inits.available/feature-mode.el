(auto-package-install '(feature-mode))

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
