(add-to-list 'auto-mode-alist
             (cons (concat "\\."
                           (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss") t) "\\'")
                   'nxml-mode))

(unify-8859-on-decoding-mode)

(setq magic-mode-alist
	  (cons '("<＼＼?xml " . nxml-mode)
            magic-mode-alist))
(fset 'xml-mode 'nxml-mode)

;; comment out if you want to edit HTML files in nxml-mode.
;;(fset 'html-mode 'nxml-mode)
