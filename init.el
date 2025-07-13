(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(use-package evil
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package flycheck-rust
  :ensure t)

(with-eval-after-load 'rust-ts-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (add-hook 'rust-ts-mode-hook 'lsp-deferred)
  (add-hook 'typescript-ts-mode-hook 'lsp-deferred))

(setq backup-directory-alist '(("." . "~/.emacs-bak")))
(setq treesit-language-source-alist
      '((rust "https://github.com/tree-sitter/tree-sitter-rust")
	(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))
(setq major-mode-remap-alist
      '((rust-mode . rust-ts-mode)))

(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil flycheck flycheck-rust gnu-elpa-keyring-update lsp-mode
	  rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
