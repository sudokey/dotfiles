;; TODO
;; * Make modeline with minimal sources

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(setq my/root-dir default-directory)

(load-file "~/.emacs.d/base.el")
(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/keys.el")
