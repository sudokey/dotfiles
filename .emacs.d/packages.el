(use-package evil
  :ensure t
  :init
  (setq-default evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox t))
