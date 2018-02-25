(use-package web-mode
  :ensure t
  :defer t
  :mode (("\\.phtml$" . web-mode)
         ("\\.tpl\\.php$" . web-mode)
         ("\\.jsp$" . web-mode)
         ("\\.as[cp]x$" . web-mode)
         ("\\.erb$" . web-mode)
         ("\\.html?$" . web-mode))
  :config
  (defun my-web-mode-hook ()
    "hooks for web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-style-padding 2)
    (setq web-mode-script-padding 2)
    (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "SlateGrey"))
  (add-hook 'web-mode-hook 'my-web-mode-hook))
