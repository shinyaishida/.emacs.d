(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "ellemtel")

             (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             ;; (setq c-auto-newline t)

             ;; (c-set-offset 'statement-block-intro '+)
             ;; (c-set-offset 'substatement-open '+)
             ;; (c-set-offset 'statement-case-open '+)
             ;; (c-set-offset 'statement-cont '+)
             (c-set-offset 'arglist-intro '++)
             (c-set-offset 'arglist-cont '0)
             (c-set-offset 'arglist-cont-nonempty '++)
             (c-set-offset 'arglist-close '0)
             (c-set-offset 'comment-intro '0)

             (define-key c-mode-base-map (kbd "C-c m") 'compile)
             (define-key c-mode-base-map (kbd "C-c s") 'shell-command)

             (auto-revert-mode)
             ))
