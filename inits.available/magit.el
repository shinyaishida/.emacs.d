; Install prerequisite packages automatically.
(dolist (pkg '(magit))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(add-to-list 'load-path (local-path-to "magit"))
(require 'magit)
