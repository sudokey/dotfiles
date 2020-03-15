(setq root-path (with-current-buffer "*scratch*" default-directory))
(setq root-dir-name (file-name-nondirectory(directory-file-name(file-name-directory root-path))))

;; add melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; default to utf-8 encoding
(set-default-coding-systems 'utf-8)

;; disable menu, toolbar and margin
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(fringe-mode 0)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; disable welcome screen
(setq inhibit-startup-screen t)

;; color theme
(load-theme 'wombat)

;; highlight current line
(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :inherit nil :background "gray10")

;; remove vertical line symbols
(set-face-background 'vertical-border (face-attribute 'mode-line :background))
(set-face-foreground 'vertical-border (face-background 'vertical-border))

;; disable bold font
(mapc
 (lambda (face)
   (when (eq (face-attribute face :weight) 'bold)
     (set-face-attribute face nil :weight 'normal)))
 (face-list))

;; file ends of new line
(setq require-final-newline t)

;; tabs settinsg
(setq-default indent-tabs-mode nil)
(setq custom-tab-width 2)
(setq-default js-indent-level custom-tab-width)
(setq-default typescript-indent-level custom-tab-width)

;; highlight parentheses
(show-paren-mode t)

;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; whitespace mode
(setq my-whitespace-color "gray23")
(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark)))
(global-whitespace-mode t)

(custom-set-faces
 `(whitespace-space ((t (:bold ,t :foreground ,my-whitespace-color :background ,nil))))
 `(whitespace-empty ((t (:foreground ,my-whitespace-color :background ,nil))))
 `(whitespace-hspace ((t (:foreground ,my-whitespace-color :background ,nil))))
 `(whitespace-indentation ((t (:foreground ,my-whitespace-color :background ,nil))))
 `(whitespace-line ((t (:foreground ,nil :background ,nil))))
 `(whitespace-newline ((t (:foreground ,my-whitespace-color :background ,nil))))
 `(whitespace-space-after-tab ((t (:foreground ,my-whitespace-color :background ,nil))))
 `(whitespace-space-before-tab ((t (:foreground ,my-whitespace-color :background ,nil))))
 `(whitespace-tab ((t (:foreground ,my-whitespace-color :background ,nil))))
 `(whitespace-trailing ((t (:foreground ,my-whitespace-color :background ,nil))))
 )

(setq whitespace-display-mappings
      '(
        (space-mark 32 [183] [46])
        (newline-mark 10 [8629 10])
        (tab-mark 9 [8594 9] [92 9])
        ))

;; mode line
(defun simple-mode-line-render (left right)
  "Return a string of `window-width' length containing LEFT, and RIGHT aligned respectively."
  (let* ((available-width (- (window-total-width) (+ (length (format-mode-line left)) (length (format-mode-line right))))))
    (append left (list (format (format "%%%ds" available-width) "")) right)
    )
  )

(setq-default mode-line-format
              '((:eval (simple-mode-line-render
                        ;; left
                        '((:eval root-dir-name) "/" (:eval (file-relative-name buffer-file-name root-path)))
                        ;; right
                        '((:eval mode-line-modified) " L%l %p " mode-line-modes mode-line-misc-info)))))

;; git gutter
(use-package git-gutter
  :ensure t
  :init
  (custom-set-variables
   '(git-gutter:modified-sign "▎")
   '(git-gutter:added-sign "▎")
   '(git-gutter:deleted-sign "▎"))
  :config
  (progn
    (global-git-gutter-mode t)
    (set-face-foreground 'git-gutter:modified "cyan")
    (set-face-foreground 'git-gutter:added "green")
    (set-face-foreground 'git-gutter:deleted "red")))

;; typescript
(use-package typescript-mode
  :ensure t)

;; neotree
(defun neotree-show-and-find ()
  (interactive)
  (catch 'return
    (setq current-buffer-file-name (buffer-file-name))
    (if (null current-buffer-file-name)
        (neotree-show)
      (neotree-dir root-path)
      (neotree-find current-buffer-file-name))))

(use-package neotree
  :ensure t
  :bind
  (("C-x C-n" . 'neotree-toggle)
   ("C-x C-j" . 'neotree-show-and-find))
  :config
  (setq-default neo-show-hidden-files t)
  (setq-default neo-window-width 35))

(use-package helm
  :ensure t
  :bind
  (("C-x C-b" . 'helm-mini)
   ("M-x" . 'helm-M-x)
   ("C-x C-f" . 'helm-find-files))
  :config
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (setq helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-ff-search-library-in-sexp t
        helm-scroll-amount 8
        helm-ff-file-name-history-use-recentf t
        helm-echo-input-in-header-line t
        helm-autoresize-max-height 0
        helm-autoresize-min-height 20
        helm-M-x-fuzzy-match t
        helm-recentf-fuzzy-match t)
  (helm-autoresize-mode 1)
  (helm-mode 1))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(defun open-next-line (arg)
  "Move to the next line and then opens a line. See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

(defun open-previous-line (arg)
  "Open a new line before the current one. See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

(defun top-join-line ()
  "Join the current line with the line beneath it."
  (interactive)
  (delete-indentation 1))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

;; key bindings
(setq tab-always-indent 'complete)
(global-set-key (kbd "C-x j") 'top-join-line)
(global-set-key (kbd "C-o") 'open-next-line)
(global-set-key (kbd "M-o") 'open-previous-line)
(global-set-key (kbd "C-c .") 'global-whitespace-mode)
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region-or-line)

;; disable auto-update .emacs with package-selected-packages
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
