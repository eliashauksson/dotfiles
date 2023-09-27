;; start emacs server
(server-start)

;; no empty line indicators
(setq indicate-empty-lines nil)

;; no cursor in inactive windows
(setq cursor-in-non-selected-windows nil)

;; text mode as default
(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)

;; no line break space points
(setq auto-fill-mode nil)

;; disable warning bell
(setq ring-bell-function 'ignore)

;; enable system clipboard
(setq-default select-enable-clipboard t)

;; enable line breaks
(global-visual-line-mode 1)

;; no tabs
(setq-default indent-tabs-mode nil)

;; tab-space equivalence
(setq-default tab-width 4)

;; line numbers
(setq my-line-numbers-exceptions '(eshell-mode
                                   term-mode))

(defun my-conditional-line-numbers ()
  (unless (member major-mode my-line-numbers-exceptions)
    (display-line-numbers-mode 1)))

(add-hook 'after-change-major-mode-hook 'my-conditional-line-numbers)

;; rainbow delimiters
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(setq my-rainbow-delimiters-modes '(clojure-mode
                                    emacs-lisp-mode))

(dolist (mode my-rainbow-delimiters-modes)
  (add-hook (intern (concat (symbol-name mode) "-hook"))
            'rainbow-delimiters-mode))

;; default encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)

(provide 'defaults)
