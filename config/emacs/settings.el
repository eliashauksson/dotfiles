;;; settings.el --- Emacs configuration: user settings and basic behavior.

;;; Commentary:
;; This file contains user-specific settings and basic behavior.

;;; Code:

;; set username and email
(setq user-full-name "Elías Hauksson"
      user-mail-address "eliashauksson@protonmail.com")

;; ensure emacs always uses UTF-8
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")

;; set text mode as default
(setq initial-major-mode 'text-mode
      major-mode 'text-mode)

;; disable some startup things
(setq-default
 inhibit-startup-screen t
 inhibit-startup-message t
 inhibit-startup-echo-area-message t
 initial-scratch-message ""
 initial-buffer-choice t)

;; better backup handling
(setq backup-directory-alist '(("." . "~/.saves"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      create-lockfiles nil)

;; use line numbers
(defvar my/line-numbers-exceptions '(eshell-mode term-mode)
  "List of major modes where line numbers should not be displayed.")

(defun my/conditional-line-numbers ()
  "Enable line numbers unless current mode is in `my/line-numbers-exceptions`."
  (unless (member major-mode my/line-numbers-exceptions)
    (display-line-numbers-mode 1)))
(add-hook 'after-change-major-mode-hook 'my/conditional-line-numbers)

;; use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; stop cursor from blinking
(blink-cursor-mode 0)

;; automatic theme toggling
(defun my/is-dark-theme? ()
  "Check if dark theme should be used."
  (let ((bashrc-content (shell-command-to-string "cat ~/.bashrc"))
	(theme-regex "^export THEME=\\(.*\\)$"))
    (if (string-match theme-regex bashrc-content)
	(string= "DARK" (match-string 1 bashrc-content))
      nil)))

(defun my/toggle-theme ()
  "Toggle between light and dark themes."
  (interactive)
  (if (my/is-dark-theme?)
      (load-theme 'doom-nord t)
    (load-theme 'doom-nord-light t)))

(provide 'settings)
;;; settings.el ends here
