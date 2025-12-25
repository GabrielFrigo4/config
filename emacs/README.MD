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
 * **Segurança:** Backups (`~`) e Lockfiles (`.#`) desativados.

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
