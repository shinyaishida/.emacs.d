(add-hook 'shell-script-mode-hook
	  '(lambda()
	     ;; This short-cut key is orginarlly bound to index variable.
	     (local-set-key "\C-c\C-l" 'goto-line)
	     (setq fill-column 80)))
