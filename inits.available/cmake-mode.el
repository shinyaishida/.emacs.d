(defun auto-package-install (pkgs)
  "Install packages"
  (dolist (pkg pkgs)
    (unless (package-installed-p pkg)
      (package-install pkg))))

(auto-package-install '(cmake-mode))

(require 'cmake-mode)
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))
