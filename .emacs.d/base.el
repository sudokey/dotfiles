;; short version of yes or no
(fset #'yes-or-no-p #'y-or-n-p)

;; default to utf-8 encoding
(set-default-coding-systems 'utf-8)

;; disable menu, toolbar and margin
(menu-bar-mode -1)
(tool-bar-mode -1)

;; disable auto-save, auto-backup and lockfiles
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; disable welcome screen
(setq inhibit-startup-screen t)

;; highlight current line
(global-hl-line-mode t)

;; truncate lines
(add-hook 'prog-mode-hook 'toggle-truncate-lines)
(add-hook 'dired-mode-hook 'toggle-truncate-lines)

;; word wrap
(set-default 'word-wrap t)

;; remove $
(set-display-table-slot standard-display-table 0 ?\ )

;; remove vertical line symbols
(set-face-background 'vertical-border (face-attribute 'mode-line :background))
(set-face-foreground 'vertical-border (face-background 'vertical-border))

;; file ends of new line
(setq require-final-newline t)

;; tabs settinsg
(setq-default indent-tabs-mode nil)
(setq custom-tab-width 4)
(setq-default js-indent-level custom-tab-width)
(setq-default typescript-indent-level custom-tab-width)

;; highlight parentheses
(show-paren-mode t)

;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Hide the cursor in inactive windows
(setq cursor-in-non-selected-windows t)

;; open styl as less
(add-to-list 'auto-mode-alist '("\\.styl$" . less-css-mode))
