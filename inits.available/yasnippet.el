(auto-package-install '(yasnippet))

(defvar yasnippet-home (local-path-to "yasnippet"))
(add-to-list 'load-path yasnippet-home)
(use-package yasnippet
  :defer t
  :mode (("\\.yasnippet$" . snippet-mode)
         ("\\.yas$" . snippet-mode))
  :config
  (bind-keys :map yas-minor-mode-map
             ("C-x i i" . yas-insert-snippet)
             ("C-x i n" . yas-new-snippet)
             ("C-x i v" . yas-visit-snippet-file))

  (fset 'yes-or-no-p 'y-or-n-p)
  (setq yas-use-menu nil)
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets" "~/.emacs.d/site-lisp/yasnippet/snippets"))

  (yas-global-mode 1)
  ;; (add-hook 'cc-mode-hook 'yas-minor-mode-on)
  ;; (add-hook 'c-mode-hook 'yas-minor-mode-on)
  ;; (add-hook 'c++-mode-hook 'yas-minor-mode-on)
  ;; (add-hook 'shell-script-mode-hook 'yas-minor-mode-on)

  ;;(custom-set-variables '(yas-trigger-key "TAB"))

  ;; ; indent snippets following the mode.
  ;; (defun yas/indent-snippet ()
  ;;   (indent-region yas/snippet-beg yas/snippet-end)
  ;;   (indent-according-to-mode))
  ;; (add-hook 'yas/after-exit-snippet-hook 'yas/indent-snippet)

  ;;
  ;; Support by helm
  ;;

  ;; Overwrite function yas-visit-snippet-file so as to work with helm.
  ;; This part is extracted from yasnippet.el.
  (defun yas-visit-snippet-file ()
    "Choose a snippet to edit, selection like `yas-insert-snippet'.
Only success if selected snippet was loaded from a file.  Put the
visited file in `snippet-mode'."
    (interactive)
    (let* ((yas-buffer-local-condition 'always)
           (templates (yas--all-templates (yas--get-snippet-tables)))
           ;;(yas-prompt-functions '(yas-ido-prompt yas-completing-prompt))
           (template (and templates
                          (or (yas--prompt-for-template templates "Choose a snippet template to edit: ")
                              (car templates)))))
      (if template
          (yas--visit-snippet-file-1 template)
        (message "No snippets tables active!"))))

  ;; Interface to helm
  ;;(custom-set-variables
  ;; '(yas/trigger-key "M-o")
  ;; '(yas/snippet-dirs yas-snippet-dirs))
  (eval-after-load "helm-config"
    '(progn
       (defun my-yas/prompt (prompt choices &optional display-fn)
         (let* ((names (loop for choice in choices
                             collect (or (and display-fn (funcall display-fn choice))
                                         choice)))
                (selected (helm-other-buffer
                           `(((name . ,(format "%s" prompt))
                              (candidates . names)
                              (action . (("Insert snippet" . (lambda (arg) arg))))))
                           "*helm yas/prompt*")))
           (if selected
               (let ((n (position selected names :test 'equal)))
                 (nth n choices))
             (signal 'quit "user quit!"))))
       (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
       (define-key helm-command-map (kbd "y") 'yas/insert-snippet)))
)
