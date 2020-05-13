(defun my/change-root-dir ()
  (interactive)
  (setq my/root-dir (counsel-read-directory-name "Select root dir: ")))

(defun my/search-in-root-dir ()
  (interactive)
  (counsel-rg "" my/root-dir "" "Search in root: "))

(defun my/search-in-dir ()
  (interactive)
  (counsel-rg "" (counsel-read-directory-name "Select search dir: ") "" "Search: "))

(defun my/fzf-in-root-dir ()
  (interactive)
  (counsel-fzf "" my/root-dir "Fzf in root: "))

(defun my/fzf-in-dir ()
  (interactive)
  (counsel-fzf "" (counsel-read-directory-name "Select fzf dir: ") "Fzf: "))

(defun my/treemacs-visit-vsplit-and-hide ()
  (interactive)
  (treemacs-visit-node-horizontal-split)
  (treemacs))

(defun my/treemacs-visit-and-hide ()
  (interactive)
  (treemacs-visit-node-in-most-recently-used-window)
  (treemacs))
