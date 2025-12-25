;;; ultimate.el --- Emacs 30 Ultimate Setup (Native IDE) -*- lexical-binding: t; -*-

;; --- HERANÇA: Carrega o Standard ---
(load (expand-file-name "standard" user-emacs-directory))

;; --- Treesitter (Parser de Sintaxe Nativo) ---
(require 'treesit)
(setq treesit-font-lock-level 4)

(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (python-mode . python-ts-mode)
        (js-mode . js-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (json-mode . json-ts-mode)
        (go-mode . go-ts-mode)
        (rust-mode . rust-ts-mode)
        (css-mode . css-ts-mode)
        (yaml-mode . yaml-ts-mode)))

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(defun my/install-grammars ()
  (interactive)
  (dolist (grammar treesit-language-source-alist)
    (treesit-install-language-grammar (car grammar))))

;; --- LSP (Eglot - Nativo) ---
(require 'eglot)
(setq eglot-autoshutdown t)

(add-hook 'c-ts-mode-hook 'eglot-ensure)
(add-hook 'rust-ts-mode-hook 'eglot-ensure)
(add-hook 'python-ts-mode-hook 'eglot-ensure)
(add-hook 'go-ts-mode-hook 'eglot-ensure)
(add-hook 'js-ts-mode-hook 'eglot-ensure)

;; --- Regras de Indentação (Hooks Específicos) ---

(defun my/indent-2-spaces ()
  (setq-local tab-width 2)
  (setq-local indent-tabs-mode nil))

(add-hook 'js-ts-mode-hook #'my/indent-2-spaces)
(add-hook 'typescript-ts-mode-hook #'my/indent-2-spaces)
(add-hook 'html-mode-hook #'my/indent-2-spaces)
(add-hook 'lua-mode-hook #'my/indent-2-spaces)

(defun my/indent-hard-tabs ()
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode t))

(add-hook 'go-ts-mode-hook #'my/indent-hard-tabs)
(add-hook 'makefile-mode-hook #'my/indent-hard-tabs)

(defun my/indent-4-spaces ()
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode nil))

(add-hook 'python-ts-mode-hook #'my/indent-4-spaces)
(add-hook 'c-ts-mode-hook #'my/indent-4-spaces)
(add-hook 'rust-ts-mode-hook #'my/indent-4-spaces)

;; --- Project.el ---
(require 'project)
(global-set-key (kbd "C-x p f") 'project-find-file)
