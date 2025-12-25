;;; minimal.el --- Emacs 30 Minimal Setup (Rescue Mode) -*- lexical-binding: t; -*-

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
