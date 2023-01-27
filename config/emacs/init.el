(require 'package)

;; set package.el repositories
(setq package-archives '(("org" . "https://orgmode.org/elpa/")
			 ("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

;; initialize built-in package management
(package-initialize)

;; update package list on first time install
(unless package-archive-contents
  (package-refresh-contents))

;; a list of pkgs ot programmatically install
(setq my-package-list '(use-package))

;; programmatically install pkgs on personal list
(dolist (package my-package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; load use-package package
(require 'use-package)

;; set :ensure t for all packages
(setq use-package-always-ensure t)

;; Hide startup splash
(setq inhibit-startup-message t)

;; Hide some unwanted gui
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Add the theme directory to path
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")
(load-theme 'catppuccin t)
(setq catppuccin-flavor 'macchiato)
(catppuccin-reload)

;; Change to Iosevka font
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font 14"))

;; enable clipboard
(setq-default select-enable-clipboard t)

;; use iBuffer as default
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; disable cursor blinking
(blink-cursor-mode 0)

;; add line numbers when in programming mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; set text mode as default
(setq-default initial-major-mode 'text-mode
	      default-major-mode 'text-mode)

;; enable visual line mode for prog and text mode
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'prog-mode-hook 'visual-line-mode)

;; setup ivy
(use-package counsel
  :init
  (ivy-mode)
  :bind
  ("C-s" . swiper))

;; setup which-key
(use-package which-key
  :init
  (which-key-mode))

;; setup rainbow delimiters
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; setup clojure mode
(use-package clojure-mode)

;; setup cider
(use-package cider)

;; setup elpy
(use-package elpy
  :init
  (elpy-enable)
  :hook
  (elpy-mode . (lambda () (highlight-indentation-mode -1))))

;; setup magit
(use-package magit)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit elpy cider clojure-mode rainbow-delimiters which-key counsel use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
