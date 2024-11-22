;;; init.el --- Main initialization file for Emacs

;;; Commentary:
;; This is the main configuration file for Emacs.  It sets up core functionality
;; and loads additional configurations.

;; features:
;; - starts the Emacs server.
;; - load configuration files for settings and package management.
;; - toggles a default theme using function my/toggle-theme (if defined).

;; additional configuration files
;; - settings.el contains general Emacs settings.
;; - packages.el handles package installation and configuration.

;;; Code:

;; start server
(require 'server)
(unless (server-running-p)
    (server-start))

(defun my/load-config-file (file)
  "Load a configuration FILE from `~/.config/emacs/`."
  (load (expand-file-name file "~/.config/emacs/")))

(my/load-config-file "settings")
(my/load-config-file "packages")

;; toggle theme
(when (fboundp 'my/toggle-theme)
  (my/toggle-theme))

;; user defined init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck copilot company company-mode doom-modeline counsel rainbow-delimiters doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
