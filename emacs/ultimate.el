;;; ultimate.el --- Emacs 30 Ultimate Setup (Native IDE) -*- lexical-binding: t; -*-

;; --- Herança: Carrega o Standard ---
(load (expand-file-name "standard" user-emacs-directory))

;; --- Treesitter ---
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
        (yaml-mode . yaml-ts-mode)
        (sh-mode . bash-ts-mode)))

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

(defun install-grammars ()
  "Instala gramáticas do Treesitter listadas."
  (interactive)
  (dolist (grammar treesit-language-source-alist)
    (let ((lang (car grammar)))
      (if (treesit-language-available-p lang)
          (message "Gramática já instalada: %s" lang)
        (message "Instalando gramática: %s..." lang)
        (condition-case err
            (treesit-install-language-grammar lang)
          (error (message "Erro ao instalar %s: %s" lang err)))))))

;; --- LSP (Eglot) ---
(require 'eglot)
(setq eglot-autoshutdown t)
(setq eglot-stay-out-of '(font-lock))

(add-hook 'c-ts-mode-hook 'eglot-ensure)
(add-hook 'rust-ts-mode-hook 'eglot-ensure)
(add-hook 'python-ts-mode-hook 'eglot-ensure)
(add-hook 'go-ts-mode-hook 'eglot-ensure)
(add-hook 'js-ts-mode-hook 'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'eglot-ensure)

;; --- Autocomplete ---
(setq tab-always-indent 'complete)
(setq completion-cycle-threshold 3)

;; --- Indentação por Linguagem ---
(defun ultimate/indent-2-spaces ()
  (setq-local tab-width 2)
  (setq-local indent-tabs-mode nil))

(add-hook 'js-ts-mode-hook #'ultimate/indent-2-spaces)
(add-hook 'typescript-ts-mode-hook #'ultimate/indent-2-spaces)
(add-hook 'html-mode-hook #'ultimate/indent-2-spaces)
(add-hook 'lua-mode-hook #'ultimate/indent-2-spaces)
(add-hook 'json-ts-mode-hook #'ultimate/indent-2-spaces)

(defun ultimate/indent-4-spaces ()
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode nil))

(add-hook 'python-ts-mode-hook #'ultimate/indent-4-spaces)
(add-hook 'c-ts-mode-hook #'ultimate/indent-4-spaces)
(add-hook 'rust-ts-mode-hook #'ultimate/indent-4-spaces)

(defun ultimate/indent-hard-tabs ()
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode t))

(add-hook 'go-ts-mode-hook #'ultimate/indent-hard-tabs)
(add-hook 'makefile-mode-hook #'ultimate/indent-hard-tabs)

;; --- Projetos ---
(require 'project)
(global-set-key (kbd "C-x p f") 'project-find-file)
(global-set-key (kbd "C-x p p") 'project-switch-project)
(global-set-key (kbd "C-x p k") 'project-kill-buffers)

;; --- Provide ---
(provide 'ultimate)
