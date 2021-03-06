;;;; Init file for emacs with basic configurations

;;;; System additions
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" default))
 '(package-selected-packages
   '(chronos lua-mode go-mode evil amx doom-modeline gruvbox-theme which-key company sly))
 '(recentf-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Package addition
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(setq package-list '(sly
		     amx
		     evil
		     company
		     chronos
		     go-mode
		     lua-mode
		     which-key
		     doom-modeline
		     gruvbox-theme
		     ))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;;; System configuration

;; enhancements
(doom-modeline-mode 1)
(which-key-mode)
(evil-mode 1)
(amx-mode 1)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

;; Completion
(add-hook 'after-init-hook 'global-company-mode)

;; visual
(setq-default display-line-numbers 'relative)
(load-theme 'gruvbox-dark-hard)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; languages
(setq inferior-lisp-program "sbcl")

;; org
(setq org-agenda-files (list "~/.org/system.org"
			     "~/.org/work.org"))

;; keybindings
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(emacs-init-time)
