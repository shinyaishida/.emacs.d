;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;;   Emacs startup file
;;; Code:
(defconst local-site-lisp-dir
  (concat user-emacs-directory "/elpa") "The path to a local site-lisp directory")
(defun local-path-to (rel_path)
  "Convert a relative path in the local site-lisp to the absolute path."
  (concat local-site-lisp-dir "/" rel_path))
(defun auto-package-install (pkgs)
  "Install packages if they have not been installed yet."
  (dolist (pkg pkgs)
    (unless (package-installed-p pkg)
      (package-install pkg))))
(defvar prerequisite-packages
  '(init-loader auto-package-update use-package) "prerequisite packages")

;; Save custom variables in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Use package.el to manage packages
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(auto-package-install prerequisite-packages)

;; Update installed packages
(require 'auto-package-update)
(setq auto-package-update-delete-old-versions t)
(add-hook 'auto-package-update-before-hook
          (lambda () (message "Update packages")))
(auto-package-update-maybe)

;; Use use-package macro
(eval-when-compile
  (require 'use-package))

;; Load additional configurations by init-loader
(use-package init-loader)
(init-loader-load (concat user-emacs-directory "/inits"))

;;; init.el ends here
