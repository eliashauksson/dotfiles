(defvar my/init-start-time (current-time) "Time when init.el was started")
(defvar my/section-start-time (current-time) "Time when section was started")
(defun my/report-time (section)
  (message "%-36s %.2fs"
	   (concat section " " "section time: ")
	   (float-time (time-subtract (current-time) my/section-start-time))))

(server-start)

;; Package management
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-list
      '(vc-backup
        rainbow-delimiters
        elpy
        company))

(dolist (package package-list)
  (straight-use-package package))

(straight-use-package
 '(nano-theme :type git :host github :repo "rougier/nano-theme"))

;; disable some default startup things
(setq-default
 inhibit-startup-screen t
 inhibit-startup-message t
 inhibit-startup-echo-area-message t
 initial-scratch-message ""
 initial-buffer-choice t)

;; utf-8 encoding
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; recovery
(setq auto-save-list-file-prefix
      (expand-file-name ".auto-save-list/.saves-" user-emacs-directory)
      auto-save-default t
      auto-save-timout 20
      auto-save-interval 200)

;; backups
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups" user-emacs-directory)))
      make-backup-files t
      vc-make-backup-files t
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-old-versions 6
      kept-new-versions 9
      delete-by-moving-to-trash t)

(setq initial-major-mode 'text-mode
      default-major-mode 'text-mode)

(setq-default indent-tabs-mode nil
	      tab-width 4)

(setq my-line-numbers-exceptions '(eshell-mode
				   term-mode))
(defun my-conditional-line-numbers ()
  (unless (member major-mode my-line-numbers-exceptions)
    (display-line-numbers-mode 1)))
(add-hook 'after-change-major-mode-hook 'my-conditional-line-numbers)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(my/report-time "Core")
(setq my/section-start-time (current-time))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq-default window-divider-default-right-width 24
	      window-divider-default-places 'right-only
	      left-margin-width 0
	      right-margin-width 0
	      window-combination-resize nil)
(window-divider-mode 1)

(blink-cursor-mode 0)

(require 'nano-theme)

(defun is-dark-theme? ()
  (let ((bashrc-content (shell-command-to-string "cat ~/.bashrc"))
        (theme-regex "^export THEME=\\(.*\\)$"))
    (if (string-match theme-regex bashrc-content)
        (string= "DARK" (match-string 1 bashrc-content))
      nil)))

(defun my-toggle-theme-function ()
  (interactive)
  (if (is-dark-theme?) (nano-dark) (nano-light)))

(my-toggle-theme-function)

(setq default-frame-alist
      (append (list
	       '(font . "Iosevka Term Nerd Font 13")
	       '(vertical-scroll-bars . nil)
	       '(internal-border-width . 12)
	       '(left-fringe . 1)
	       '(tool-bar-lines . 0)
	       '(menu-bar-lines . 0))))

(setq my-rainbow-delimiters-modes '(clojure-mode
                                    emacs-lisp-mode))
(dolist (mode my-rainbow-delimiters-modes)
  (add-hook (intern (concat (symbol-name mode) "-hook"))
            'rainbow-delimiters-mode))

(my/report-time "UI")
(setq my/section-start-time (current-time))

(global-company-mode)

(elpy-enable)

(my/report-time "Programming")
(setq my/section-start-time (current-time))

(let ((init-time (float-time (time-subtract (current-time) my/init-start-time)))
      (total-time (string-to-number (emacs-init-time))))

  (message "---------------------------------------------------------------")
  (message "Initialization time:                 %.2fs (+ %.2f system time)"
           init-time (- total-time init-time))
  (message "---------------------------------------------------------------"))
