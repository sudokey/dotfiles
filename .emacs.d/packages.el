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

(use-package treemacs
  :ensure t
  :defer t)

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)
