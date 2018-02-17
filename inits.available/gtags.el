(add-to-list 'load-path (local-path-to "gtags"))

(autoload 'gtags-mode "gtags" "" t)

(setq gtags-mode-hook
      '(lambda ()
         (local-set-key (kbd "M-t") 'gtags-find-tag) ; find function definition
         (local-set-key (kbd "M-r") 'gtags-find-rtag) ; find point of reference
         (local-set-key (kbd "M-s") 'gtags-find-symbol) ; find variable definition
         (local-set-key (kbd "C-t") 'gtags-pop-stack) ; rollback

         (setq gtags-auto-update t)
         (setq gtags-select-buffer-single t) ; use only a single buffer
         (setq helm-c-gtags-path-style 'root)
         (setq helm-c-gtags-ignore-case nil)
         ))

(add-hook 'c-mode-common-hook 'gtags-mode)
(add-hook 'c++-mode-common-hook 'gtags-mode)
