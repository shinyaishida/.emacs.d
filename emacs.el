(defconst local-emacs-home "~/.emacs.d" "The path to the local emacs directory")
(defconst local-site-lisp-dir
  (concat local-emacs-home "/elpa") "The path to a local site-lisp directory")
(defun local-path-to (rel_path)
  "Converts a relative path in the local site-lisp to the absolute path."
  (concat local-site-lisp-dir "/" rel_path))
(defvar prerequisite-packages
  '(init-loader auto-package-update) "prerequisite packages")

;; Use package.el to manage packages
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(dolist (pkg prerequisite-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Update installed packages
(require 'auto-package-update)
(setq auto-package-update-delete-old-versions t)
(add-hook 'auto-package-update-before-hook
	  (lambda () (message "Update packages")))
(auto-package-update-maybe)

;; Load additional configurations by init-loader
(require 'init-loader)
(init-loader-load (concat local-emacs-home "/inits"))

;;
;; end of file
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-ff-auto-update-initial-value nil)
 '(package-selected-packages
   (quote
    (auto-complete package-utils init-loader helm auto-package-update)))
 '(yas-prompt-functions (quote (my-yas/prompt))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
