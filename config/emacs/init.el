;; setup package system
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			             ("melpa" . "https://melpa.org/packages/")))

(unless (bound-and-true-p package--initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;; default settings
(require 'defaults)

;; colortheme
(require 'theme)

;; key bindings
(require 'bindings)

;; counsel
(require 'my-counsel)

;; markdown
(require 'my-markdown)

;; org
(require 'my-org)

;; clojure
(require 'my-clojure)

;; python
(require 'my-python)

;; latex
(require 'my-latex)

;; magit
(require 'my-magit)

;; welcome message
(let ((inhibit-message t))
  (message "Welcome to GNU Emacs")
  (message (format "Initialization time: %s" (emacs-init-time))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(magit cider auctex org-roam-ui rainbow-delimiters markdown-mode counsel catppuccin-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
