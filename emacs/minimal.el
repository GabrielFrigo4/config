;;; minimal.el --- Emacs 30 Minimal Setup (Rescue Mode) -*- lexical-binding: t; -*-

;; --- Otimização de Startup (GC Inteligente, 128MB) ---
(defvar file-name-handler-alist-original file-name-handler-alist)
(defvar gc-cons-threshold-original gc-cons-threshold)

(setq gc-cons-threshold 134217728
      file-name-handler-alist nil)

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold gc-cons-threshold-original
                  file-name-handler-alist file-name-handler-alist-original)
            (garbage-collect)))

;; --- Core UI (Limpando a Casa) ---
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; --- Emacs 30 Modern Defaults ---
(setq use-short-answers t)
(setq vc-follow-symlinks t)

;; --- Visual Básico ---
(load-theme 'misterioso t)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; --- Encoding & Segurança ---
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; --- Indentação Padrão ---
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; --- Provide ---
(provide 'minimal)
