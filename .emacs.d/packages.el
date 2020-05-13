(use-package evil
  :ensure t
  :init
  (setq-default
   evil-want-C-u-scroll t
   evil-vsplit-window-right t
   evil-split-window-below t)
  :config
  (evil-mode t))

(use-package gruvbox-theme
  :ensure t
  :config
  (set-face-background 'vertical-border (face-attribute 'mode-line-inactive :background))
  (set-face-foreground 'vertical-border (face-background 'vertical-border))
  (load-theme 'gruvbox t))

(use-package ivy
  :ensure t
  :config
  (setq
    ivy-use-virtual-buffers t
    ivy-count-format "(%d/%d) "
    ivy-wrap t
    ivy-height 20)
  (ivy-mode t))

(use-package counsel
  :after ivy
  :ensure t
  :config
  (counsel-mode 1))

(use-package rg
  :ensure t
  :config
  (rg-enable-default-bindings))

(use-package avy
  :ensure t)

(use-package treemacs
  :ensure t
  :defer t
  :config
  (setq
   treemacs-is-never-other-window t))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode t))

(use-package highlight-symbol
  :ensure t
  :config
  (setq-default highlight-symbol-idle-delay 0.5)
  (add-hook 'prog-mode-hook 'highlight-symbol-mode))

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t))

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (setq ac-sources
        '(ac-source-features
          ac-source-functions
          ac-source-yasnippet
          ac-source-variables
          ac-source-symbols
          ac-source-abbrev
          ac-source-imenu
          ac-source-dictionary
          ac-source-files-in-current-dir
          ac-source-words-in-all-buffer)))

(use-package evil-nerd-commenter
  :after evil
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.[jt]sx?$" . web-mode))
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))

(use-package zoom
  :ensure t)

(use-package balanced-windows
  :ensure t
  :config
  (balanced-windows-mode))

(use-package editorconfig
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))
