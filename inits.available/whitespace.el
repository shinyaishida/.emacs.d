(require 'whitespace)
(setq whitespace-style
      '(face
        trailing
        tabs
        spaces
        space-mark
        tab-mark))
(setq whitespace-display-mappings
      '((space-mark ?\ [?\xB7] [?.])
        (space-mark ?\xA0 [?\xA4] [?_])
        (newline-mark ?\n [?\xB6 ?\n] [?$ ?\n])
        (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
(set-face-attribute 'whitespace-trailing nil
                    :foreground "RoyalBlue4"
                    :background "RoyalBlue4"
                    :underline nil)
(set-face-attribute 'whitespace-tab nil
                    :foreground "yellow4"
                    :background "yellow4"
                    :underline nil)
(set-face-attribute 'whitespace-space nil
                    :foreground "gray40"
                    :background "gray20"
                    :underline nil)
;(global-whitespace-mode t)
