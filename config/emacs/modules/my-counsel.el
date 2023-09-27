;; install counsel
(unless (package-installed-p 'counsel)
  (package-install 'counsel))

(require 'counsel)

(global-set-key (kbd "C-s") 'swiper)

(ivy-mode 1)

(provide 'my-counsel)
