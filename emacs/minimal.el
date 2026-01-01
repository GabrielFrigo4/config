;;; minimal.el --- Emacs 30 Minimal Setup (Rescue Mode) -*- lexical-binding: t; -*-

;; --- Otimização de Inicialização (GC & I/O) ---
(defvar file-name-handler-alist-original file-name-handler-alist)
(defvar gc-cons-threshold-original gc-cons-threshold)

(setq gc-cons-threshold most-positive-fixnum
      read-process-output-max (expt 2 20)
      file-name-handler-alist nil
      load-prefer-newer t)

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold gc-cons-threshold-original
                  file-name-handler-alist file-name-handler-alist-original)
            (garbage-collect)))

;; --- UI Minimalista (Redução de Ruído) ---
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)

;; --- Defaults Modernos ---
(setq use-short-answers t)
(setq vc-follow-symlinks t)

;; --- Visual Básico ---
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; --- Encoding (Universal: Linux, Windows, BSD) ---
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; --- Gerenciamento de Arquivos Temporários ---
(setq make-backup-files nil)
(setq create-lockfiles t)
(setq lock-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; --- Indentação Padrão (Spaces > Tabs) ---
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; --- Provide ---
(provide 'minimal)
