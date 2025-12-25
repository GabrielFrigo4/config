;;; standard.el --- Emacs 30 Standard Setup (Daily Driver) -*- lexical-binding: t; -*-

;; --- HERANÇA: Carrega o Minimal ---
(load (expand-file-name "minimal" user-emacs-directory))

;; --- Recursos Nativos do Emacs 30 ---
(which-key-mode 1)
(pixel-scroll-precision-mode 1)
(touch-screen-mode 1)
(editorconfig-mode 1)

;; --- UX (Busca e Histórico) ---
(fido-vertical-mode 1)
(setq icomplete-show-matches-on-no-input t)
(savehist-mode 1)
(save-place-mode 1)
(recentf-mode 1)

;; --- Teclado & Mouse ---
(xterm-mouse-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
