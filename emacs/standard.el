;;; standard.el --- Emacs 30 Standard Setup (Daily Driver) -*- lexical-binding: t; -*-

;; --- HERANÇA: Carrega o Minimal ---
(load (expand-file-name "minimal" user-emacs-directory))

;; --- Visual & Tema (Integração do seu setup atual) ---
(mapc #'disable-theme custom-enabled-themes)
(load-theme 'wombat t)

(when (display-graphic-p)
  (set-face-attribute 'default nil :font "JetBrainsMono NF" :height 120)
  (set-face-attribute 'variable-pitch nil :font "Sans Serif" :height 120))

;; --- Recursos Nativos do Emacs 30 ---
(which-key-mode 1)
(pixel-scroll-precision-mode 1)
(touch-screen-mode 1)
(editorconfig-mode 1)

;; --- UX & Interface ---
(setq icomplete-show-matches-on-no-input t)
(column-number-mode 1)
(fido-vertical-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(recentf-mode 1)

;; --- Teclado & Mouse ---
(xterm-mouse-mode 1)
(context-menu-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; --- Provide ---
(provide 'standard)
