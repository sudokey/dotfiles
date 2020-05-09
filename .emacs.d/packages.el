(use-package evil
  :ensure t
  :init
  (setq-default evil-want-C-u-scroll t)
  (setq-default evil-shift-width custom-tab-width)
  :config
  (evil-mode t))

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox t))

(use-package ivy
  :ensure t
  :config
  (ivy-mode t))

(use-package counsel
  :after ivy
  :ensure t
  :config
  (counsel-mode 1))

(use-package avy
  :ensure t)

(use-package treemacs
  :ensure t
  :defer t)

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
