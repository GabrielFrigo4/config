;;; standard.el --- Emacs 30 Standard Setup (Daily Driver) -*- lexical-binding: t; -*-

;; --- Herança: Carrega o Minimal ---
(load (expand-file-name "minimal" user-emacs-directory))

;; --- Visual & Tema ---
(mapc #'disable-theme custom-enabled-themes)
(load-theme 'wombat t)

(setq font-lock-maximum-decoration t)
(add-to-list 'default-frame-alist '(width . 87))
(add-to-list 'default-frame-alist '(height . 29))

;; --- Fontes (Daemon Safe) ---
(defun standard/configure-faces ()
  (when (display-graphic-p)
    (add-to-list 'default-frame-alist '(font . "JetBrainsMono NF-12"))
    (set-face-attribute 'default nil :font "JetBrainsMono NF" :height 120)
    (set-face-attribute 'variable-pitch nil :font "Sans Serif" :height 120)))

(standard/configure-faces)
(add-hook 'server-after-make-frame-hook #'standard/configure-faces)

;; --- Indentação Global ---
(setq c-default-style "user")
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; --- Recursos Nativos ---
(which-key-mode 1)
(pixel-scroll-precision-mode 1)
(touch-screen-mode 1)
(editorconfig-mode 1)

;; --- UX & Interface ---
(setq icomplete-show-matches-on-no-input t)
(column-number-mode 1)
(fido-vertical-mode 1)

;; --- Histórico ---
(setq savehist-file (expand-file-name "savehist" user-cache-directory))
(setq recentf-save-file (expand-file-name "recentf" user-cache-directory))
(setq save-place-file (expand-file-name "places" user-cache-directory))

(savehist-mode 1)
(save-place-mode 1)
(recentf-mode 1)

;; --- Janelas e Arquivos ---
(winner-mode 1)
(windmove-default-keybindings)
(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-dwim-target t)
(setq dired-listing-switches "-agho --group-directories-first")

;; --- Input ---
(xterm-mouse-mode 1)
(context-menu-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; --- Provide ---
(provide 'standard)
