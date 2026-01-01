;;; standard.el --- Emacs 30 Standard Setup (Daily Driver) -*- lexical-binding: t; -*-

;; --- Herança: Carrega o Minimal ---
(load (expand-file-name "minimal" user-emacs-directory))

;; --- Diretórios de Cache (Limpeza da Home) ---
(defvar user-cache-directory (expand-file-name "var/" user-emacs-directory))
(unless (file-exists-p user-cache-directory)
  (make-directory user-cache-directory))

;; --- Visual & Tema ---
(mapc #'disable-theme custom-enabled-themes)
(load-theme 'wombat t)

;; --- Configuração de Fontes (Daemon Safe) ---
(defun my/configure-faces ()
  "Define fontes de forma segura para GUI e emacsclient."
  (when (display-graphic-p)
    (add-to-list 'default-frame-alist '(font . "JetBrainsMono NF-12"))
    (set-face-attribute 'default nil :font "JetBrainsMono NF" :height 120)
    (set-face-attribute 'variable-pitch nil :font "Sans Serif" :height 120)))

(my/configure-faces)
(add-hook 'server-after-make-frame-hook #'my/configure-faces)

;; --- Recursos Nativos (Emacs 30) ---
(which-key-mode 1)
(pixel-scroll-precision-mode 1)
(touch-screen-mode 1)
(editorconfig-mode 1)

;; --- UX & Interface ---
(setq icomplete-show-matches-on-no-input t)
(column-number-mode 1)
(fido-vertical-mode 1)

;; --- Histórico e Persistência ---
(setq savehist-file (expand-file-name "savehist" user-cache-directory))
(setq recentf-save-file (expand-file-name "recentf" user-cache-directory))
(setq save-place-file (expand-file-name "places" user-cache-directory))

(savehist-mode 1)
(save-place-mode 1)
(recentf-mode 1)

;; --- Gerenciamento de Janelas (Window Management) ---
(winner-mode 1)
(windmove-default-keybindings)

;; --- Gerenciamento de Arquivos (Dired) ---
(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-dwim-target t)
(setq dired-listing-switches "-agho --group-directories-first")

;; --- Teclado & Mouse ---
(xterm-mouse-mode 1)
(context-menu-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; --- Provide ---
(provide 'standard)
