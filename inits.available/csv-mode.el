(add-to-list 'load-path "~/.emacs.d/site-lisp/csv")
(require 'csv-mode)
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode" "CSV" t)
