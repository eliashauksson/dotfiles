;;; early-init.el --- Early initialization settings for Emacs

;;; Commentary:
;; This file contains early initialization settings for Emacs.
;; It is loaded before the package system and GUI is initialized.

;; features:
;; - disable gui elements like menu bar, scroll bar, tool bar, and tooltips.
;; - sets the default font to "Iosevka Term Nerd Font".
;; - adjusts garbage collection threshold for faster startup.
;; - ensures pixel-perfect window resizing.

;;; Code:

;; turn off unwanted gui elements
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

;; set default font
(add-to-list 'default-frame-alist
	     '(font . "Iosevka Term Nerd Font 13"))

;; increase garbage collection threshold for faster startup
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
	  #'(lambda () (setq gc-cons-threshold (* 8 1024 1024))))

;; make windows resize pixel perfect and not after line height
(setq frame-resize-pixelwise t)

(provide 'early-init)
;;; early-init ends here
