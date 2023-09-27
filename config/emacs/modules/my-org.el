(unless (package-installed-p 'org-roam)
  (package-install 'org-roam))

(setq org-roam-directory (file-truename "~/Documents/Roam"))
(org-roam-db-autosync-mode)

(unless (package-installed-p 'org-roam-ui)
  (package-install 'org-roam-ui))

(provide 'my-org)
