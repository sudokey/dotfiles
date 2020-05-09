;; Evil mode
(evil-set-leader 'normal ",")

;; Base
(evil-define-key 'normal 'global (kbd "<DEL>") 'treemacs)
(evil-define-key 'normal 'global (kbd "<leader>r") 'my/change-root-dir)
(evil-define-key 'normal 'global (kbd "<leader>s") 'my/search-in-root-dir)
(evil-define-key 'normal 'global (kbd "<leader>S") 'my/search-in-dir)
(evil-define-key 'normal 'global (kbd "<leader>f") 'my/fzf-in-root-dir)
(evil-define-key 'normal 'global (kbd "<leader>F") 'my/fzf-in-dir)
(evil-define-key 'normal 'global (kbd "<leader>b") 'balance-windows)
(evil-define-key 'normal 'global (kbd "<leader>m") 'maximize-window)
(evil-define-key 'normal 'global (kbd "<leader>w") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>q") 'delete-window)
(evil-define-key 'normal 'global (kbd "<leader>v") 'split-window-horizontally)

;; Treemacs
(evil-define-key 'treemacs treemacs-mode-map (kbd "DEL") 'treemacs)

;; Avy
(global-set-key (kbd "M-i") 'avy-goto-char-timer)

;; Drag stuff
(global-set-key (kbd "ESC <down>") 'drag-stuff-down)
(global-set-key (kbd "ESC <up>") 'drag-stuff-up)

;; Swiper
(global-set-key (kbd "C-s") 'swiper-isearch)
