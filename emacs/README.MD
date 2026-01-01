# Emacs Configuration (Modular & Native 30+)
 Configuração moderna e modular para o Emacs, focada em recursos nativos do **Emacs 30+** (Treesit, Eglot, EditorConfig) e organizada em níveis de complexidade.

## ⚠️ Pré-requisitos Visuais
 Para a experiência completa (Nível Standard/Ultimate), esta configuração espera que você tenha a seguinte fonte instalada no sistema:
 * **[JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases)** (Usada para ícones e ligaduras).

## 📂 Localização e Caminhos
 Os arquivos `.el` da configuração (`minimal.el`, `standard.el`, `ultimate.el`) devem ser colocados na **pasta de configuração do usuário**:

 | Sistema Operacional | Pasta de Configuração (`user-emacs-directory`) | Arquivo de Inicialização (`init.el`) |
 | :--- | :--- | :--- |
 | **Unix (Linux/macOS)** | `~/.emacs.d/` | `~/.emacs.d/init.el` |
 | **Windows** | `%AppData%\.emacs.d\` | `~/_emacs` ou `~/.emacs.d/init.el` |

> **⚠️ Aviso para Windows:** Para o correto funcionamento do `emacs-client` (e evitar bugs de encoding), é necessário ativar o suporte global a UTF-8 no sistema.
>
> Acesse as configurações de **Hora e Idioma > Idioma e Região > Idioma de Exibição do Windows** e marque a opção *"Beta: Use Unicode UTF-8 for worldwide language support"*.
>
> **Guias passo a passo:**
> * [Windows 10](https://scholarslab.lib.virginia.edu/learn-twarc/08-win-region-settings)
> * [Windows 11](https://windows.atsit.in/32315/)

---

## ⚡ Quick Setup (One-Liners)
 Se você precisar configurar um servidor rapidamente ou testar o setup sem clonar o repositório, use estes comandos. Eles geram um `.emacs` funcional usando apenas o sistema de customização nativo.

### Nível 1: Minimal (Rescue)
 Focado em UTF-8, velocidade e limpeza visual.

 ```bash
 cat << 'EOF' > "$HOME/.emacs"
 (custom-set-variables
  ;; --- Core & Encoding ---
  '(current-language-environment "UTF-8")
  '(inhibit-startup-screen t)
  '(initial-scratch-message nil)
  '(ring-bell-function 'ignore)
 
  ;; --- UI Limpa ---
  '(menu-bar-mode nil)
  '(tool-bar-mode nil)
  '(scroll-bar-mode nil)
  '(use-short-answers t)
  '(global-display-line-numbers-mode t)
  '(display-line-numbers-type 'relative)
 
  ;; --- Segurança & Arquivos ---
  '(make-backup-files nil)
  '(create-lockfiles nil)
 
  ;; --- Indentação (Spaces > Tabs) ---
  '(indent-tabs-mode nil)
  '(tab-width 4))
 EOF
 ```

### Nível 2: Standard (Daily Driver)
 Adiciona tema Wombat, fontes, melhorias de UX (Fido, Dired, Which-key) e persistência de histórico.

 ```bash
 cat << 'EOF' > "$HOME/.emacs"
 (custom-set-variables
  ;; --- Core & Minimal ---
  '(current-language-environment "UTF-8")
  '(inhibit-startup-screen t)
  '(menu-bar-mode nil)
  '(tool-bar-mode nil)
  '(scroll-bar-mode nil)
  '(use-short-answers t)
  '(global-display-line-numbers-mode t)
  '(display-line-numbers-type 'relative)
  '(make-backup-files nil)
  '(create-lockfiles nil)
  '(indent-tabs-mode nil)
  '(tab-width 4)

  ;; --- Standard: Visual ---
  '(custom-enabled-themes '(wombat))
  '(c-default-style "user")
  '(default-frame-alist '((width . 87) (height . 29)))
  '(font-lock-maximum-decoration t)
  '(column-number-mode t)
 
  ;; --- Standard: UX & Navegação ---
  '(fido-vertical-mode t)
  '(which-key-mode t)
  '(pixel-scroll-precision-mode t)
  '(context-menu-mode t)
  '(winner-mode t)
  '(electric-pair-mode t)
  '(xterm-mouse-mode t)
 
  ;; --- Standard: Histórico ---
  '(savehist-mode t)
  '(recentf-mode t)
  '(save-place-mode t)
 
  ;; --- Standard: Dired ---
  '(dired-listing-switches "-agho --group-directories-first")
  '(dired-dwim-target t)
  '(dired-kill-when-opening-new-dired-buffer t))

 (custom-set-faces
  '(default ((t (:family "JetBrainsMono NF" :foundry "outline" :slant normal :weight regular :height 120 :width normal))))
  '(variable-pitch ((t (:family "Sans Serif" :height 120)))))
 EOF
 ```

### Nível 3: Ultimate (Native IDE)
 Inclui tudo do Standard e ativa o mapeamento do **Treesitter** e configurações do **Eglot**.
 
 *Nota:* Como este formato não suporta `hooks` complexos, o Eglot deve ser iniciado manualmente com `M-x eglot` quando necessário.

 ```bash
 cat << 'EOF' > "$HOME/.emacs"
 (custom-set-variables
  ;; --- Core & Minimal ---
  '(current-language-environment "UTF-8")
  '(inhibit-startup-screen t)
  '(menu-bar-mode nil)
  '(tool-bar-mode nil)
  '(scroll-bar-mode nil)
  '(use-short-answers t)
  '(global-display-line-numbers-mode t)
  '(display-line-numbers-type 'relative)
  '(make-backup-files nil)
  '(create-lockfiles nil)
  '(indent-tabs-mode nil)
  '(tab-width 4)

  ;; --- Standard: Visual & UX ---
  '(custom-enabled-themes '(wombat))
  '(c-default-style "user")
  '(default-frame-alist '((width . 87) (height . 29)))
  '(font-lock-maximum-decoration t)
  '(column-number-mode t)
  '(fido-vertical-mode t)
  '(which-key-mode t)
  '(pixel-scroll-precision-mode t)
  '(context-menu-mode t)
  '(winner-mode t)
  '(electric-pair-mode t)
  '(xterm-mouse-mode t)
  '(savehist-mode t)
  '(recentf-mode t)
  '(save-place-mode t)
 
  ;; --- Standard: Dired ---
  '(dired-listing-switches "-agho --group-directories-first")
  '(dired-dwim-target t)
  '(dired-kill-when-opening-new-dired-buffer t)

  ;; --- Ultimate: IDE (Eglot & Treesit) ---
  '(eglot-autoshutdown t)
  '(treesit-font-lock-level 4)
  '(major-mode-remap-alist
    '((c-mode . c-ts-mode)
      (python-mode . python-ts-mode)
      (js-mode . js-ts-mode)
      (typescript-mode . typescript-ts-mode)
      (json-mode . json-ts-mode)
      (go-mode . go-ts-mode)
      (rust-mode . rust-ts-mode)
      (sh-mode . bash-ts-mode)
      (yaml-mode . yaml-ts-mode))))

 (custom-set-faces
  '(default ((t (:family "JetBrainsMono NF" :foundry "outline" :slant normal :weight regular :height 120 :width normal))))
  '(variable-pitch ((t (:family "Sans Serif" :height 120)))))
 EOF
 ```

---

## 🚀 Instalação e Uso
 Esta configuração usa um sistema de **cascata**. Você só precisa carregar o nível mais alto que deseja usar no seu `init.el`, e ele carregará os níveis inferiores automaticamente.

 Adicione **uma** das linhas abaixo ao seu arquivo de inicialização:

### 1. Ultimate (Recomendado)
 Carrega: *Ultimate → Standard → Minimal*.
 ```elisp
 ;; init.el
 (load (expand-file-name "ultimate" user-emacs-directory))
 ```

### 2. Standard (Leve)
 Carrega: *Standard → Minimal*.

 ```elisp
 ;; init.el
 (load (expand-file-name "standard" user-emacs-directory))
 ```

### 3. Minimal (Rescue Mode)
 Carrega apenas o básico.

 ```elisp
 ;; init.el
 (load (expand-file-name "minimal" user-emacs-directory))
 ```

---

## ✨ Perfis de Configuração

### `minimal.el` (Rescue Mode)
 * **Foco:** Compatibilidade, segurança e velocidade de boot (<0.1s).
 * **Uso:** Terminais simples, servidores remotos, edições rápidas.
 * **Recursos:**
 * **Startup Otimizado:** Ajuste dinâmico do *Garbage Collector* durante a inicialização.
 * **Clean UI:** Sem barras, menus ou ruído visual.
 * **Segurança:** Backups (`~`) desativados e Lockfiles (`.#`) movidos para diretório temporário.

### `standard.el` (Daily Driver)
 * **Foco:** Conforto visual e recursos modernos do Emacs 30.
 * **Recursos:**
 * **Visual:** Fonte **JetBrainsMono NF (12pt)** e tema **Wombat** integrados nativamente.
 * **Navegação:** `Pixel-scroll` (rolagem suave) e `Fido-mode` (busca moderna vertical).
 * **UX:** `Which-key` (ajuda de atalhos) e Mouse ativado no terminal (`xterm-mouse`).
 * **EditorConfig:** Suporte nativo ativado.

### `ultimate.el` (Native IDE)
 * **Foco:** Desenvolvimento de software de alto desempenho.
 * **Recursos:**
 * **Treesit:** Highlight de sintaxe baseado em AST (muito mais rápido que regex).
 * *Dica:* Use `M-x my/install-grammars` na primeira vez para instalar as linguagens.
 * **Eglot:** Cliente LSP nativo configurado para iniciar automaticamente (`clangd`, `pyright`, etc).
 * **Indentação Inteligente:**
 * *Hard Tabs (4):* Go, Makefile.
 * *Soft Tabs (2):* Web (JS/TS/HTML), Lua.
 * *Soft Tabs (4):* C, Rust, Python.
