(unless (package-installed-p 'elpy)
  (package-install 'elpy))

(elpy-enable)

(provide 'my-python)
