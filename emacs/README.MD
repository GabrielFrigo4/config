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
 Se você precisar configurar um servidor rapidamente ou testar o setup sem clonar o repositório, use estes comandos no terminal. Eles geram um `.emacs` funcional usando apenas o sistema de customização nativo.

### Nível 1: Minimal (Rescue)
 Focado em UTF-8, velocidade e limpeza visual. Inclui numeração de linhas para edição moderna.

 ```bash
 cat << 'EOF' > "$HOME/.emacs"
 (custom-set-variables
  ;; --- Core & Encoding ---
  '(current-language-environment "UTF-8")
  '(inhibit-startup-screen t)
  '(initial-scratch-message nil)
  '(ring-bell-function 'ignore)
  '(vc-follow-symlinks t)
  ;; --- UI Limpa ---
  '(menu-bar-mode nil)
  '(tool-bar-mode nil)
  '(scroll-bar-mode nil)
  '(use-short-answers t)
  '(global-display-line-numbers-mode t)
  '(display-line-numbers-type 'relative)
  ;; --- Segurança & Arquivos ---
  '(make-backup-files nil)
  '(create-lockfiles nil))
 EOF
 ```

### Nível 2: Standard (Daily Driver)
 Adiciona tema Wombat, fontes, melhorias de UX (Fido, Dired, Which-key, EditorConfig) e persistência de histórico.

 ```bash
 cat << 'EOF' > "$HOME/.emacs"
 (custom-set-variables
  ;; --- Core & Encoding ---
  '(current-language-environment "UTF-8")
  '(inhibit-startup-screen t)
  '(initial-scratch-message nil)
  '(ring-bell-function 'ignore)
  '(vc-follow-symlinks t)
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
  ;; --- Visual ---
  '(custom-enabled-themes '(wombat))
  '(default-frame-alist '((width . 87) (height . 29)))
  '(font-lock-maximum-decoration t)
  '(column-number-mode t)
  ;; --- Indentação Global ---
  '(c-default-style "user")
  '(indent-tabs-mode nil)
  '(tab-width 4)
  ;; --- UX & Navegação ---
  '(fido-vertical-mode t)
  '(which-key-mode t)
  '(pixel-scroll-precision-mode t)
  '(touch-screen-mode t)
  '(context-menu-mode t)
  '(winner-mode t)
  '(electric-pair-mode t)
  '(xterm-mouse-mode t)
  '(editorconfig-mode t)
  ;; --- Histórico ---
  '(savehist-mode t)
  '(recentf-mode t)
  '(save-place-mode t)
  ;; --- Dired ---
  '(dired-listing-switches "-agho --group-directories-first")
  '(dired-dwim-target t)
  '(dired-kill-when-opening-new-dired-buffer t))

 ;; Fontes
 (custom-set-faces
  '(default ((t (:family "JetBrainsMono NF" :foundry "outline" :slant normal :weight regular :height 120 :width normal))))
  '(variable-pitch ((t (:family "Sans Serif" :height 120)))))

 ;; Ativa navegação entre janelas com Shift+Setas
 (windmove-default-keybindings)
 EOF
 ```

### Nível 3: Ultimate (Native IDE)

Inclui tudo do Standard e ativa o mapeamento do **Treesitter** e configurações do **Eglot**.

*Nota:* Esta versão "One-Liner" configura o mapeamento. Para as cores funcionarem, você precisará instalar as gramáticas manualmente com `M-x treesit-install-language-grammar`.

 ```bash
 cat << 'EOF' > "$HOME/.emacs"
 (require 'treesit)
 (require 'eglot)
 (require 'project)

 ;; --- Regras de Indentação Específicas (Hooks) ---
 (dolist (mode '(js-ts-mode-hook typescript-ts-mode-hook html-mode-hook lua-mode-hook json-ts-mode-hook))
   (add-hook mode (lambda () (setq-local tab-width 2 indent-tabs-mode nil))))

 (dolist (mode '(go-ts-mode-hook makefile-mode-hook))
   (add-hook mode (lambda () (setq-local tab-width 4 indent-tabs-mode t))))

 (custom-set-variables
  ;; --- Core & Encoding ---
  '(current-language-environment "UTF-8")
  '(inhibit-startup-screen t)
  '(initial-scratch-message nil)
  '(ring-bell-function 'ignore)
  '(vc-follow-symlinks t)
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
  ;; --- Visual ---
  '(custom-enabled-themes '(wombat))
  '(default-frame-alist '((width . 87) (height . 29)))
  '(font-lock-maximum-decoration t)
  '(column-number-mode t)
  ;; --- Indentação Global ---
  '(c-default-style "user")
  '(indent-tabs-mode nil)
  '(tab-width 4)
  ;; --- UX & Navegação ---
  '(fido-vertical-mode t)
  '(which-key-mode t)
  '(pixel-scroll-precision-mode t)
  '(touch-screen-mode t)
  '(context-menu-mode t)
  '(winner-mode t)
  '(electric-pair-mode t)
  '(xterm-mouse-mode t)
  '(editorconfig-mode t)
  ;; --- Histórico ---
  '(savehist-mode t)
  '(recentf-mode t)
  '(save-place-mode t)
  ;; --- Dired ---
  '(dired-listing-switches "-agho --group-directories-first")
  '(dired-dwim-target t)
  '(dired-kill-when-opening-new-dired-buffer t)
  ;; --- IDE Settings ---
  '(eglot-autoshutdown t)
  '(eglot-stay-out-of '(font-lock))
  '(treesit-font-lock-level 4)
  '(tab-always-indent 'complete)
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

 (windmove-default-keybindings)
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
 * **Foco:** Compatibilidade, segurança e velocidade.
 * **Recursos:**
 * **Limpeza:** Use `M-x minimal/clean-var-directory` para resetar caches e `M-x minimal/clean-backup-directory` para limpar backups antigos.
 * **Segurança:** Backups centralizados em `var/backups` (lógica de rotação "Sanduíche": mantém o início e o fim do histórico).

### `standard.el` (Daily Driver)
 * **Foco:** Conforto visual e edição geral.
 * **Recursos:**
 * **Visual:** Fonte **JetBrainsMono NF** e tema **Wombat**.
 * **Navegação:** `Pixel-scroll` (suave), `Fido-mode` (busca vertical) e `Dired` otimizado.
 * **UX:** Mouse no terminal, `EditorConfig` nativo e suporte a Touch Screen.

### `ultimate.el` (Native IDE)
 * **Foco:** Desenvolvimento de software.
 * **Recursos:**
 * **Treesit:** Highlight moderno. Use `M-x ultimate/install-grammars` para instalar linguagens.
 * **Eglot (LSP):** Autocomplete e diagnósticos. Use `M-x eglot` se não iniciar sozinho.
 * **Indentação:** Regras específicas ativadas automaticamente (ex: Go usa Tabs, Web usa 2 espaços).

---

## 📚 Referências

### 🚀 Doom Emacs & Configuração
 * [Doom Emacs Documentation](https://github.com/doomemacs/doomemacs/blob/master/docs/index.org) - Guia oficial de instalação e customização.
 * [Doom Module Index](https://github.com/doomemacs/doomemacs/tree/master/modules) - Lista de todas as flags (como `+lsp`, `+tree-sitter`) e como configurá-las.
 * [Nerd Fonts](https://www.nerdfonts.com/) - Fontes necessárias para os ícones do Doom.

### 🧠 Core Emacs
 * [GNU Emacs Manual](https://www.gnu.org/software/emacs/manual/) - Manual oficial completo.
 * [Emacs Wiki](https://www.emacswiki.org/) - A maior base de conhecimento comunitária.
 * [Mastering Emacs](https://www.masteringemacs.org/) - Artigos excelentes para entender como o Emacs funciona a fundo.

### 🛠️ Tecnologias Usadas
 * [Emacs Tree-sitter Starter Guide](https://www.masteringemacs.org/article/how-to-get-started-tree-sitter) - Como funciona o novo motor de syntax highlighting.
 * [LSP Mode (Doom Default)](https://emacs-lsp.github.io/lsp-mode/) - Documentação do cliente LSP padrão do Doom.
 * [EditorConfig for Emacs](https://github.com/editorconfig/editorconfig-emacs) - Plugin para manter consistência de estilo de código entre editores.

---

## Instalar as Dependências no Ubuntu/Debian
 ```bash
 sudo apt install --yes emacs
 sudo apt install --yes libtree-sitter0
 sudo apt install --yes libtree-sitter-dev
 sudo apt install --yes build-essential
 sudo apt install --yes repgrep
 sudo apt install --yes ripgrep
 sudo apt install --yes fd-find
 sudo apt install --yes git
 ```

## Instalar as Dependências no Manjaro/Arch
 ```bash
 sudo pacman --needed --noconfirm -S emacs
 sudo pacman --needed --noconfirm -S tree-sitter
 sudo pacman --needed --noconfirm -S base-devel
 sudo pacman --needed --noconfirm -S repgrep
 sudo pacman --needed --noconfirm -S ripgrep
 sudo pacman --needed --noconfirm -S fd
 sudo pacman --needed --noconfirm -S git
 ```

## Instalação Rápida do Doom Emacs com Configuração Básica
 ```bash
 # Remove Lixo
 rm -rf "$HOME/.emacs" 2> "/dev/null"
 rm -rf "$HOME/.emacs.d" 2> "/dev/null"
 rm -rf "$HOME/.config/emacs" 2> "/dev/null"
 rm -rf "$HOME/.config/doom" 2> "/dev/null"

 # Setup Doom Emacs
 git clone --depth 1 "https://github.com/doomemacs/doomemacs" "$HOME/.config/emacs"
 mkdir -p "$HOME/.config/doom/snippets"
 ~/.config/emacs/bin/doom install --force
 ~/.config/emacs/bin/doom sync

 # Setup Nerd Icons
 wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip" -O "NerdFontsSymbolsOnly.zip"
 unzip -o "NerdFontsSymbolsOnly.zip" -d "$HOME/.local/share/fonts"
 rm -f "$HOME/.local/share/fonts/10-nerd-font-symbols.conf"
 rm -f "$HOME/.local/share/fonts/LICENSE"
 rm -f "$HOME/.local/share/fonts/README.md"
 rm "NerdFontsSymbolsOnly.zip"
 fc-cache -fv

 # Install JetBrains Mono
 bash -c "$(curl -fsSL "https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh")"
 wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" -O "JetBrainsMono.zip"
 unzip JetBrainsMono.zip -d "$HOME/.local/share/fonts"
 rm -f "$HOME/.local/share/fonts/OFL.txt"
 rm -f "$HOME/.local/share/fonts/README.md"
 rm -f JetBrainsMono.zip
 fc-cache -fv

 # Setup init.el
 sed -i 's/;;tree-sitter/tree-sitter/' "$HOME/.config/doom/init.el"
 sed -i 's/;;(cc +lsp)/(cc +lsp +tree-sitter)/' "$HOME/.config/doom/init.el"
 sed -i 's/;;(rust +lsp)/(rust +lsp +tree-sitter)/' "$HOME/.config/doom/init.el"
 sed -i 's/;;python/(python +lsp +tree-sitter)/' "$HOME/.config/doom/init.el"
 sed -i 's/;;javascript/(javascript +lsp +tree-sitter)/' "$HOME/.config/doom/init.el"
 sed -i 's/;;typescript/(typescript +lsp +tree-sitter)/' "$HOME/.config/doom/init.el"
 sed -i 's/;;toml/(toml +lsp +tree-sitter)/' "$HOME/.config/doom/init.el"
 sed -i 's/;;sql/(sql +lsp +tree-sitter)/' "$HOME/.config/doom/init.el"
 sed -i 's/sh[[:space:]]*;/(sh +tree-sitter) ;/' "$HOME/.config/doom/init.el"
 ~/.config/emacs/bin/doom sync

 # Setup config.el
 cat << 'EOF' | tee -a "$HOME/.config/doom/config.el" > "/dev/null"
 ;; Configuração de Fonte (JetBrains Mono)
 (setq doom-font (font-spec :family "JetBrainsMonoNL Nerd Font Mono" :size 16 :weight 'medium)
       doom-variable-pitch-font (font-spec :family "JetBrainsMonoNL Nerd Font Mono" :size 16))
 ;; Ativar Cursor Piscante
 (blink-cursor-mode t)
 EOF
 ~/.config/emacs/bin/doom sync
 ```
