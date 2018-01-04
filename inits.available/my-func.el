(defun reset-emacs ()
  "Reload .emacs"
  (interactive)
  (load-file "~/.emacs"))

;;
;; quoted from http://www.emacswiki.org/emacs/BackwardDeleteWord
;;

(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun delete-word-backward (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))
