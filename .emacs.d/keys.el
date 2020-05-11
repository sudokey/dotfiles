;; Evil mode
(evil-set-leader 'normal ",")

;; Leader
(evil-define-key 'normal 'global (kbd "<leader>c") 'my/change-root-dir)
(evil-define-key 'normal 'global (kbd "<leader>s") 'my/search-in-root-dir)
(evil-define-key 'normal 'global (kbd "<leader>S") 'my/search-in-dir)
(evil-define-key 'normal 'global (kbd "<leader>f") 'my/fzf-in-root-dir)
(evil-define-key 'normal 'global (kbd "<leader>F") 'my/fzf-in-dir)
(evil-define-key 'normal 'global (kbd "<leader>w") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>r") 'ivy-resume)
(evil-define-key 'normal 'global (kbd "<leader>t") 'treemacs-select-window)
(evil-define-key 'normal 'global (kbd "<leader>z") 'zoom-mode)


;; Treemacs
(evil-define-key 'normal 'global (kbd "DEL") 'treemacs)
(evil-define-key 'treemacs treemacs-mode-map (kbd "DEL") 'treemacs)
(evil-define-key 'treemacs treemacs-mode-map (kbd "TAB") 'treemacs-toggle-node)
(evil-define-key 'treemacs treemacs-mode-map (kbd "RET") 'my/treemacs-visit-and-hide)
(evil-define-key 'treemacs treemacs-mode-map (kbd "s") 'my/treemacs-visit-vsplit-and-hide)
(evil-define-key 'treemacs treemacs-mode-map (kbd "o") 'my/treemacs-visit-and-hide)

;; Avy
(global-set-key (kbd "M-i") 'avy-goto-char-timer)

;; Drag stuff
(global-set-key (kbd "ESC <down>") 'drag-stuff-down)
(global-set-key (kbd "ESC <up>") 'drag-stuff-up)

;; Swiper
(global-set-key (kbd "C-s") 'swiper-isearch)

;; Nerd commenter
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
