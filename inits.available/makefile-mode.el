(add-hook 'makefile-mode-hook
          '(lambda ()
             (define-key makefile-mode-map (kbd "C-c m") 'compile)
             (define-key makefile-mode-map (kbd "C-c s") 'shell-command)
             ))

(add-hook 'makefile-automake-mode-hook
          '(lambda ()
             (define-key makefile-automake-mode-map (kbd "C-c m") 'compile)
             (define-key makefile-automake-mode-map (kbd "C-c s") 'shell-command)
             ))

(add-hook 'makefile-bsdmake-mode-hook
          '(lambda ()
             (define-key makefile-bsdmake-mode-map (kbd "C-c m") 'compile)
             (define-key makefile-bsdmake-mode-map (kbd "C-c s") 'shell-command)
             ))

(add-hook 'makefile-gmake-mode-hook
          '(lambda ()
             (define-key makefile-gmake-mode-map (kbd "C-c m") 'compile)
             (define-key makefile-gmake-mode-map (kbd "C-c s") 'shell-command)
             ))

(add-hook 'makefile-imake-mode-hook
          '(lambda ()
             (define-key makefile-imake-mode-map (kbd "C-c m") 'compile)
             (define-key makefile-imake-mode-map (kbd "C-c s") 'shell-command)
             ))
