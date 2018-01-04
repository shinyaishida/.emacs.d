; Install prerequisite packages automatically.
(dolist (pkg '(multiple-cursors))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(add-to-list 'load-path (local-path-to "multiple-cursors"))
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
