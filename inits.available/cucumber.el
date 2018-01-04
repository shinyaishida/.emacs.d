; Install feature-mode automatically.
(defvar fm-packages '(feature-mode))
(dolist (pkg fm-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
