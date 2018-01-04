(add-to-list 'load-path (local-path-to "lua-mode"))

(autoload 'lua-mode "lua-mode" "Lua editing mode" t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(setq lua-indent-level 2)
