(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(add-hook 'org-mode-hook
          '(lambda ()
             (setq org-log-done t)
             (local-set-key (kbd "C-c l") 'org-store-link)
             (local-set-key (kbd "C-c a") 'org-agenda)
             (load-file
              (concat (local-path-to "org-export-generic") "/org-export-generic.el"))))
