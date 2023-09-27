(unless (package-installed-p 'auctex)
  (package-install 'auctex))

(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(provide 'my-latex)
