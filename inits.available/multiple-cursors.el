(auto-package-install '(smartrep multiple-cursors))

(use-package multiple-cursors
  :defer t
  :bind (("C-M-c" . mc/edit-lines)
         ("C-M-r" . mc/mark-all-in-region))
  :init
  (use-package smartrep
    :init
    (declare-function smartrep-define-key "smartrep")
    ;; suppress keystroke echo while hitting command strokes
    (defadvice smartrep-map-internal (around smartrep-silence-echo-keystrokes activate)
      (let ((echo-keystrokes 0))
        ad-do-it)))
  (defun mc/mark-next-like-this-and-cycle-forward ()
    (interactive)
    (mc/mark-next-like-this 1)
    (mc/cycle-forward))
  (defun mc/mark-previous-like-this-and-cycle-backward ()
    (interactive)
    (mc/mark-previous-like-this 1)
    (mc/cycle-backward))
  (global-unset-key "\C-^")
  (smartrep-define-key
      global-map "\C-^" '(("n" . 'mc/mark-next-like-this-and-cycle-forward)
                          ("p" . 'mc/mark-previous-like-this-and-cycle-backward)
                          ("m" . 'mc/mark-more-like-this-extended)
                          ("u" . 'mc/unmark-next-like-this)
                          ("U" . 'mc/unmark-previous-like-this)
                          ("s" . 'mc/skip-to-next-like-this)
                          ("S" . 'mc/skip-to-previous-like-this)
                          ("*" . 'mc/mark-all-like-this)
                          ("d" . 'mc/mark-all-like-this-dwim)
                          ("i" . 'mc/insert-numbers)
                          ("o" . 'mc/sort-regions)
                          ("O" . 'mc/reverse-regions))))
