(add-to-list 'load-path "~/.emacs.d/site-lisp/shell-command")

(use-package shell-command
  :config
  (shell-command-completion-mode))
