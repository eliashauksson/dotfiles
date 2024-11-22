;;; packages.el --- Emacs configuration: package management and plugins.

;;; Commentary:
;; This file handles package management and configuration for installed packages.
;; It use `use-package` to simplify and organize package setup.

;;; Code:

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (require 'use-package))

;; color themes
(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-nord-light t))

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package nerd-icons)

;; rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; counsel package
(use-package counsel
  :ensure t
  :bind (("C-s" . swiper)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-h f" . counsel-describe-function)
	 ("C-h v" . counsel-describe-variable)
	 ("C-h o" . counsel-describe-symbol))
  :config (ivy-mode))

;; company mode
(use-package company
  :ensure t
  :init (global-company-mode))

;; flycheck syntax checking
(use-package flycheck
  :ensure t
  :config (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'packages)
;;; packages.el ends here
