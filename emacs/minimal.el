;;; minimal.el --- Emacs 30 Minimal Setup (Rescue Mode) -*- lexical-binding: t; -*-

;; --- Otimização de Inicialização ---
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

;; --- UI Minimalista ---
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)
(setq use-short-answers t)
(setq vc-follow-symlinks t)

;; --- Visual Básico (Modern Rescue) ---
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; --- Encoding ---
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; --- Arquivos Temporários e Backups ---
(setq make-backup-files nil)
(setq create-lockfiles t)
(setq lock-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(defvar user-cache-directory (expand-file-name "var/cache/" user-emacs-directory))
(unless (file-exists-p user-cache-directory) (make-directory user-cache-directory t))

(defvar user-backup-directory (expand-file-name "var/backups/" user-emacs-directory))
(unless (file-exists-p user-backup-directory) (make-directory user-backup-directory t))

(setq backup-directory-alist `((".*" . ,user-backup-directory)))
(setq auto-save-file-name-transforms `((".*" ,user-backup-directory t)))

(setq make-backup-files t
      version-control t
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 2
      kept-old-versions 1)

;; --- Funções Interativas de Limpeza ---
(defun clean-var-directory ()
  "Apaga e recria todo o diretório var/."
  (interactive)
  (let ((var-dir (expand-file-name "var/" user-emacs-directory)))
    (if (yes-or-no-p (format "ATENÇÃO: Limpar TODO o diretório '%s'? " var-dir))
        (progn
          (delete-directory var-dir t)
          (make-directory var-dir t)
          (message "Diretório var/ resetado. Reinicie o Emacs."))
      (message "Operação cancelada."))))

(defun clean-cache-directory ()
  "Limpa apenas o cache temporário."
  (interactive)
  (if (yes-or-no-p (format "ATENÇÃO: Limpar TODO o diretório '%s'? " user-cache-directory))
      (progn
        (delete-directory user-cache-directory t)
        (make-directory user-cache-directory t)
        (message "Cache limpo."))
    (message "Operação cancelada.")))

(defun clean-backup-directory ()
  "Limpa todos os backups antigos."
  (interactive)
  (if (yes-or-no-p (format "ATENÇÃO: Limpar TODO o diretório '%s'? " user-backup-directory))
      (progn
        (delete-directory user-backup-directory t)
        (make-directory user-backup-directory t)
        (message "Backups removidos."))
    (message "Operação cancelada.")))

(defun clean-current-buffer-backups ()
  "Apaga o histórico de backup do arquivo atual."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer não associado a arquivo.")
      (let ((backups (file-backup-file-names filename)))
        (if (not backups)
            (message "Sem backups para este arquivo.")
          (if (yes-or-no-p (format "Apagar %d backups de '%s'? " (length backups) filename))
              (progn
                (dolist (bkp backups)
                  (condition-case nil
                      (delete-file bkp)
                    (error (message "Erro ao apagar %s" bkp))))
                (message "Limpeza concluída!"))
            (message "Operação cancelada.")))))))

;; --- Custom File ---
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

;; --- Provide ---
(provide 'minimal)
