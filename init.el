(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package evil
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package flycheck-rust
  :ensure t)
(use-package company
  :ensure t)
(use-package weyland-yutani-theme
  :ensure t)

(load-theme `weyland-yutani t)

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
(setq major-mode-remap-alist
      '((rust-mode . rust-ts-mode)))

(setq treesit-language-source-alist
      '((bash . ("https://github.com/tree-sitter/tree-sitter-bash" "v0.23.3" nil nil nil))
        (go . ("https://github.com/tree-sitter/tree-sitter-go" "v0.23.4" nil nil nil))
        (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod" "v1.0.2" nil nil nil))
        (python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.23.6" nil nil nil))
	(rust . ("https://github.com/tree-sitter/tree-sitter-rust" "v0.23.2" nil nil nil))
	(typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "typescript/src" nil nil))
	(tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "tsx/src" nil nil))))

(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company evil flycheck flycheck-rust gnu-elpa-keyring-update lsp-mode
	     rust-mode weyland-yutani-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
