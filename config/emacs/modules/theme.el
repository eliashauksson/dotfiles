;; color theme
(unless (package-installed-p 'catppuccin-theme)
  (package-install 'catppuccin-theme))

(load-theme 'catppuccin :no-confirm)

(setq catppuccin-flavor 'latte)
(catppuccin-reload)

;; functions for toggling colortheme

(defun is-dark-theme? ()
  (let ((bashrc-content (shell-command-to-string "cat ~/.bashrc"))
        (theme-regex "^export THEME=\\(.*\\)$"))
    (if (string-match theme-regex bashrc-content)
        (string= "DARK" (match-string 1 bashrc-content))
      nil)))

(defun my-toggle-theme-function ()
  (interactive)
  (if (is-dark-theme?)
      (progn
        (setq catppuccin-flavor 'mocha)
        (catppuccin-reload))
    (progn
      (setq catppuccin-flavor 'latte)
      (catppuccin-reload))))

(my-toggle-theme-function)

(provide 'theme)
