; Install prerequisite packages automatically.
(dolist (pkg '(cmake-mode))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'cmake-mode)
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))
