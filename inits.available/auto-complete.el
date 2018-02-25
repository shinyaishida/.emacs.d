(auto-package-install '(auto-complete))

(defvar ac-home (local-path-to "auto-complete"))
(add-to-list 'load-path ac-home)
(add-to-list 'load-path (concat ac-home "/lib/ert"))
(add-to-list 'load-path (concat ac-home "/lib/fuzzy"))
(add-to-list 'load-path (concat ac-home "/lib/popup"))

(use-package auto-complete-config
  :config
  (add-to-list 'ac-dictionary-directories (local-path-to "auto-complete/dict"))

  ;;(add-to-list 'ac-modes 'helm-mode)
  (add-to-list 'ac-modes 'cc-mode)
  (add-to-list 'ac-modes 'c-mode)
  (add-to-list 'ac-modes 'c++-mode)
  (add-to-list 'ac-modes 'java-mode)
  (add-to-list 'ac-modes 'makefile-automake-mode)
  (add-to-list 'ac-modes 'makefile-bsdmake-mode)
  (add-to-list 'ac-modes 'makefile-gmake-mode)
  (add-to-list 'ac-modes 'makefile-imake-mode)
  (add-to-list 'ac-modes 'makefile-mode)
  (add-to-list 'ac-modes 'makeapp-mode)
  (add-to-list 'ac-modes 'python-mode)
  (add-to-list 'ac-modes 'ruby-mode)
  (add-to-list 'ac-modes 'shell-script-mode)

  ;;
  ;; '(ac-config-default)' optimizes the source settings for major-modes.
  ;; Modify its behavior if it is "too much" for a major-mode.
  ;;
  ;; (defvar kmy-ac-sources
  ;;   '(ac-source-abbrev  ; for Emacs abbreviations
  ;;     ;; ac-source-css-property  ; for CSS properties
  ;;     ac-source-dictionary  ; for ac-dictionary
  ;;     ;; ac-source-eclim  ; for eclim
  ;;     ;; ac-source-features  ; for features activated by 'require'
  ;;     ac-source-filename  ; for file names (triggered by '/')
  ;;     ac-source-files-in-current-dir  ; for file names in the current directory
  ;;     ac-source-functions  ; for Emacs-lisp functions (triggered by '(')
  ;;     ac-source-gtags  ; for global
  ;;     ;; ac-source-imenu  ; for imenu
  ;;     ;; ac-source-semantic  ; for semantic to complete member names
  ;;     ;; ac-source-semantic-raw  ; for semantic to complete symbols
  ;;     ac-source-symbols  ; for Emacs-lisp symbols
  ;;     ac-source-variables  ; for Emacs-lisp variables
  ;;     ;; ac-source-words-in-all-buffer  ; for words in all buffers
  ;;     ;; ac-source-words-in-buffer  ; for words in the current buffer
  ;;     ac-source-words-in-same-mode-buffers  ; for words in buffers in a same major-mode
  ;;     ac-source-yasnippet  ; for Yasnippet snippets
  ;;     ))
  ;;
  ;; (defun ac-cc-mode-setup ()
  ;;   (setq-default ac-sources my-ac-sources))
  ;; (defun ac-c-mode-setup ()
  ;;   (setq-default ac-sources my-ac-sources))
  ;; (defun ac-c++-mode-setup ()
  ;;   (setq-default ac-sources my-ac-sources))
  ;; (defun ac-java-mode-setup ()
  ;;   (setq-default ac-sources my-ac-sources))
  ;; (defun ac-makefile-mode-setup ()
  ;;   (setq-default ac-sources my-ac-sources))
  ;; (defun ac-perl-mode-setup ()
  ;;   (setq-default ac-sources my-ac-sources))
  ;; (defun ac-python-mode-setup ()
  ;;   (setq-default ac-sources my-ac-sources))
  ;; (defun ac-ruby-mode-setup ()
  ;;   (setq-default ac-sources my-ac-sources))
  ;; (add-hook 'cc-mode-common-hook 'ac-cc-mode-setup)
  ;; (add-hook 'c-mode-hook 'ac-c-mode-setup)
  ;; (add-hook 'c++-mode-hook 'ac-c++-mode-setup)
  ;; (add-hook 'java-mode-hook 'ac-java-mode-setup)
  ;; (add-hook 'makefile-mode-hook 'ac-makefile-mode-setup)
  ;; (add-hook 'perl-mode-hook 'ac-perl-mode-setup)
  ;; (add-hook 'python-mode-hook 'ac-python-mode-setup)
  ;; (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  ;; (add-hook 'shell-script-mode-hook 'ac-shell-script-mode-setup)

  (ac-config-default)
  (setq ac-ignore-case 'smart)
  (global-auto-complete-mode t)

                                        ; Use C-n/C-p to select a candidate in a pop-up menu.
  (setq ac-use-menu-map t)
  (define-key ac-menu-map (kbd "C-n") 'ac-next)
  (define-key ac-menu-map (kbd "C-p") 'ac-previous)

  ;; ; Use helm to narrow candidates.
  ;; (add-to-list 'load-path (local-path-to "ac-helm"))
  ;; (require 'ac-helm)
  ;; (define-key ac-complete-mode-map (kbd "C-;") 'ac-complete-with-helm)

  ;; ; Avoid errors raised by yasnippet
  ;; (setf (symbol-function 'yas-active-keys)
  ;;       ((lambda ()
  ;;          (remove-duplicates (mapcan #'yas-table-all-keys (yas--get-snippet-tables))))))

  ;;
  ;; Performance tuning
  ;;
  ;; Start completion after typing three letters.
  (setq ac-auto-start 3)
  ;; Delay until starting completion
  (setq ac-delay 0.1)
  ;; Delay until showing a completion menu
  (setq ac-auto-show-menu 0.5)
  ;; Enable/disable induction of candidates.
  (setq ac-use-comphist t)
  ;; Maximum number of candidates
  (setq ac-candidate-limit 5)
)
