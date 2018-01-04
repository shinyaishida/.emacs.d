(require 'flymake nil t)
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; (defun flymake-get-make-cmdline (source base-dir)
;;   (list "make"
;;         (list "-s" "-C"
;;               base-dir
;;               (concat "CHK_SOURCES=" source)
;;               "SYNTAX_CHECK_MODE=1"
;;               )))

;; Check C/C++ codes even without Makefile.
(defun flymake-simple-generic-init (cmd &optional opts)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list cmd (append opts (list local-file)))))

(defun flymake-simple-make-or-generic-init (cmd &optional opts)
  ;;
  ;; This function must check if target 'syntax-check' is in Makefile.
  ;;
  ;; (if (file-exists-p "Makefile")
  ;;     (flymake-simple-make-init)
  ;;   (flymake-simple-generic-init cmd opts))
  (flymake-simple-generic-init cmd opts))

(defun flymake-c-init ()
  (flymake-simple-make-or-generic-init
   "gcc" '("-Wall" "-Wextra" "-pedantic" "-std=c99")))

(defun flymake-cc-init ()
  (flymake-simple-make-or-generic-init
   "g++" '("-Wall" "-Wextra" "-pedantic")))

;; Set the number of checks run in parallel to 8.
(setq flymake-max-parallel-syntax-checks 8)

;; Avoid to make temporary files in same directories.
(setq flymake-run-in-place nil)
(setq temporary-file-directory "/tmp")

;; Show all errors.
(setq flymake-number-of-errors-to-display nil)

;; Ignore syntax-check failure
(defadvice flymake-post-syntax-check
  (before flymake-force-check-was-interrupted activate)
  (setq flymake-check-was-interrupted t))

;; Disable annoying warning popup dialog.
(defun flymake-display-warning (warning)
  "Display a warning to the user in the mini-buffer"
  (message warning))

;;
;; Quoted from http://www.emacswiki.org/emacs/FlyMake
;;

(defvar my-flymake-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\M-p" 'flymake-goto-prev-error)
    (define-key map "\M-n" 'flymake-goto-next-error)
    map)
  "Keymap for my flymake minor mode.")

(defun my-flymake-err-at (pos)
  (let ((overlays (overlays-at pos)))
    (remove nil
            (mapcar (lambda (overlay)
                      (and (overlay-get overlay 'flymake-overlay)
                           (overlay-get overlay 'help-echo)))
                    overlays))))

(defun my-flymake-err-echo ()
  (interactive)
  (message "%s" (mapconcat 'identity (my-flymake-err-at (point)) "\n")))

(defadvice flymake-goto-next-error (after display-message activate compile)
  (my-flymake-err-echo))

(defadvice flymake-goto-prev-error (after display-message activate compile)
  (my-flymake-err-echo))

(define-minor-mode my-flymake-minor-mode
  "Simple minor mode which adds some key bindings for moving to the next and previous errors.

Key bindings:

\\{my-flymake-minor-mode-map}"
  nil
  nil
  :keymap my-flymake-minor-mode-map)


(push '("\\.c$" flymake-c-init)
      flymake-allowed-file-name-masks)
(push '("\\.\\(cc\\|cpp\\|C\\|CPP\\|hpp\\)$" flymake-cc-init)
      flymake-allowed-file-name-masks)

(add-hook 'c-mode-common-hook 'my-flymake-minor-mode)
(add-hook 'c++-mode-common-hook 'my-flymake-minor-mode)
;; (add-hook 'cc-mode-common-hook
;;           '(lambda ()
;;              (flymake-mode t)))
