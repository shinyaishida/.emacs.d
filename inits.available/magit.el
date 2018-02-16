(auto-package-install '(magit))

(add-to-list 'load-path (local-path-to "magit"))
(require 'magit)

(global-set-key (kbd "C-c g") 'magit-status)
