# Unified Editor Configurations
 Este repositório contém configurações otimizadas e modulares para **Vim, Neovim, Helix, Emacs e Zed**.

 O objetivo é manter uma experiência de edição consistente (keybindings, indentação e comportamento) através de diferentes editores, permitindo alternar entre eles sem fricção cognitiva.

## 🧠 A Filosofia "Tiered Setup" (Níveis)
 A maioria das configurações aqui segue uma estrutura hierárquica dividida em 3 níveis de complexidade. Cada nível herda ou expande o anterior:

 | Nível | Nome do Arquivo | Cenário de Uso | Foco Principal |
 | :--- | :--- | :--- | :--- |
 | **1** | `minimal` | **Rescue / Server** | Compatibilidade máxima (SSH/TTY). Sem mouse, sem plugins pesados, visual seguro. |
 | **2** | `standard` | **Daily Driver** | Edição confortável. Cores reais (`termguicolors`), mouse ativado, clipboard do sistema. |
 | **3** | `ultimate` | **Pro / IDE** | Desenvolvimento pesado. LSP, Autocomplete, Treesitter e regras específicas de linguagem. |

---

## 📏 Regras Globais de Indentação
 Independente do editor escolhido, todos estão configurados para respeitar rigorosamente estas regras de estilo:

 * **Hard Tabs (4 de largura):** Obrigatório para **Go**, **Assembly** e **Makefiles**.
 * **2 Espaços:** Web stack (**JS, TS, HTML, CSS, JSON**) e **Lua**.
 * **4 Espaços:** Linguagens de sistema e scripts (**C, C++, Rust, Python, Java**).

---

## 🛠️ Editores Suportados

### 1. [Neovim (Lua)](./nvim)
 Configuração moderna escrita 100% em Lua.
 * **Destaques:** Carregamento modular (`require`), cursor nativo (`guicursor`), highlight ao copiar (`TextYankPost`).
 * **Caminho:** `~/.config/nvim/`

### 2. [Vim (Vimscript)](./vim)
 Configuração clássica e robusta.
 * **Destaques:** Compatibilidade legado, hacks visuais para terminais antigos.
 * **Caminho:** `~/.vimrc`

### 3. [Emacs (Native 30+)](./emacs)
 Configuração "Bleeding Edge" focada no **Emacs 30**.
 * **Destaques:** Zero dependências pesadas. Usa `treesit` (parser nativo), `eglot` (LSP nativo) e `use-package`.
 * **Caminho:** `~/.emacs.d/`

### 4. [Helix](./helix)
 Configuração modular via cópia de arquivos (já que o Helix não suporta herança dinâmica).
 * **Destaques:** Mapeamentos "Vim-Like" no nível Ultimate (Space leader).
 * **Caminho:** `~/.config/helix/`

### 5. [Zed](./zed)
 Configuração focada na experiência nativa ("Zed Style").
 * **Destaques:** **Sem Vim Mode** (uso de atalhos nativos CUA), predições de IA ativadas, LSP com caminhos absolutos.
 * **Caminho:** `~/.config/zed/`

---

## 📂 Estrutura do Repositório
 ```text
 .
 ├── emacs/
 │   ├── minimal.el
 │   ├── standard.el
 │   └── ultimate.el
 ├── helix/
 │   ├── languages.toml
 │   ├── minimal.toml
 │   ├── standard.toml
 │   └── ultimate.toml
 ├── neovim/
 │   ├── minimal.lua
 │   ├── standard.lua
 │   └── ultimate.lua
 ├── vim/
 │   ├── minimal.vim
 │   ├── standard.vim
 │   └── ultimate.vim
 └── zed/
     ├── unix/
	 │   └── settings.json
	 └── win/
	     └── settings.json
 ```

## ⚙️ Pré-Requisitos Gerais
 Para aproveitar o nível **Ultimate** em qualquer editor, recomenda-se ter instalado:

 1. **Nerd Fonts:** Para ícones na statusline (Recomendado: *JetBrainsMono* ou *MesloLGS*).
 2. **Compiladores/LSP:**
 * `clangd` (C/C++)
 * `gopls` (Go)
 * `pyright` (Python)
 * `rust-analyzer` (Rust)
 * `zls` (Zig)

 3. **Ferramentas de Busca:** `ripgrep` (rg) e `fd` (usados pelo Telescope no Nvim e Fido no Emacs).

---

## 🚀 Como Usar
 Consulte o `README` dentro da pasta de cada editor para instruções específicas de instalação e ativação dos níveis.
