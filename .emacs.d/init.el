;; Ensure use-package is installed
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Automatically update packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-interval 7)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Clojure development environment
(use-package clojure-mode
  :ensure t
  :mode ("\\.clj\\'" "\\.cljs\\'" "\\.cljc\\'" "\\.edn\\'")
  :config
  (add-hook 'clojure-mode-hook #'subword-mode))

(use-package cider
  :ensure t
  :after clojure-mode
  :config
  (setq cider-repl-display-help-banner nil)
  (add-hook 'clojure-mode-hook 'cider-mode))

;; Optional: Paredit for structured editing of Clojure code
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :hook (clojure-mode . smartparens-mode))



;; Optional: Rainbow delimiters for better visual distinction of nested parens
(use-package rainbow-delimiters
  :ensure t
  :hook (clojure-mode . rainbow-delimiters-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rainbow-delimiters paredit auto-package-update use-package lsp-ui lsp-treemacs cider)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
