(setq default-frame-alist
      (append (list
	       '(font . "Iosevka Term Nerd Font 14")
	       '(vertical-scroll-bars . nil)
	       '(internal-border-width . 24)
	       '(left-fringe . 1)
	       '(right-fringe . 1)
	       '(tool-bar-lines . 0)
	       '(menu-bar-lines . 0))))

(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      inhibit-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq window-divider-default-right-width 24)
(setq window-divider-default-place 'right-only)
(window-divider-mode 1)

(provide 'layout)
