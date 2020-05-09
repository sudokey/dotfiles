;; Evil mode
(evil-set-leader 'normal ",")

;;Treemacs
(evil-define-key 'treemacs treemacs-mode-map (kbd "DEL") 'treemacs)

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
(evil-define-key 'normal 'global (kbd "<leader>vs") 'split-window-horizontally)
