# Neovim Configuration (Tiered Setup)
 Esta é uma configuração modular e nativa em **Lua** para o Neovim, projetada para escalar desde ambientes hostis (servidores antigos) até um ambiente de desenvolvimento completo.

## 📂 Estrutura dos Arquivos
 A configuração é dividida em três níveis de complexidade. Cada nível herda do anterior através do comando `require`:

### 1. `minimal.lua` (Rescue Mode)
 * **Foco:** Compatibilidade, velocidade bruta e "Rescue Mode".
 * **Características:**
     * Usa apenas a API nativa (`vim.opt`, `vim.keymap`) sem plugins.
     * Configurações de segurança (sem backup/swap).
     * Ideal para: `root`, servidores remotos, edição rápida de arquivos `.conf`.

### 2. `standard.lua` (Daily Driver)
 * **Foco:** Edição confortável e visual moderno.
 * **Herda de:** `minimal.lua`
 * **Características:**
     * Ativa `termguicolors` e colorscheme (Evening).
     * **Cursor Nativo:** Usa `guicursor` para controlar o formato do cursor (bloco/linha) sem precisar de escape codes antigos.
     * Suporte a Mouse e Clipboard do sistema (`unnamedplus`).
     * Indentação padrão (4 espaços).

### 3. `ultimate.lua` (Pro / IDE)
 * **Foco:** Produtividade máxima e desenvolvimento de software.
 * **Herda de:** `standard.lua`
 * **Características:**
     * **Mappings Avançados:** `Space` como Leader key.
     * **Smart Backspace:** Função Lua dedicada para deletar indentação ou caracteres de forma inteligente.
     * **Visual Feedback:** Pisca o texto copiado (`TextYankPost`), recurso nativo do Lua.
     * **Linguagens (Autocmds):** Configuração granular:
         * *Web/Lua:* 2 espaços.
         * *C/C++/Rust/Java:* 4 espaços.
         * *Go/Assembly/Make:* Tabs reais (`noexpandtab`).

---

## 🚀 Instalação e Uso

### Pré-requisito: Pasta `lua`
 Para que o comando `require` funcione, seus arquivos `.lua` **devem** estar dentro de uma pasta chamada `lua` na raiz da configuração do Neovim.

 Estrutura recomendada:
 ```text
 nvim/
 ├── init.lua          <-- Arquivo de entrada
 └── lua/              <-- Pasta OBRIGATÓRIA
     ├── minimal.lua
     ├── standard.lua
     └── ultimate.lua
 ```

### Opção A: Carregamento Manual (Recomendado)
 No seu arquivo `init.lua` principal, carregue apenas o nível que deseja utilizar.

 Para usar a versão completa:

 ```lua
 -- init.lua
 require("ultimate")
 ```

 Para usar a versão leve em um servidor:

 ```lua
 -- init.lua
 require("minimal")
 ```

### Opção B: Seleção Dinâmica
 Você pode colocar isso no seu `init.lua` para carregar baseada em uma variável de ambiente do sistema operacional:

 ```lua
 -- init.lua
 if os.getenv("NVIM_MINIMAL") then
     require("minimal")
 else
     require("ultimate")
 end
 ```

---

## 📍 Caminhos
 * **Unix/Linux/Mac:** `~/.config/nvim/`
 * **Windows:** `~\AppData\Local\nvim\`
 * **Arquivo de Entrada:** `init.lua`

## ✨ Diferenças para a versão VimScript
 Esta versão Lua traz vantagens específicas sobre a versão `.vim` tradicional:

 1. **Performance:** Acesso direto à API C do Neovim via `vim.opt` e `vim.api`, sem tradução de Vimscript.
 2. **Estabilidade:** Uso de `pcall` (protected call) para carregar módulos, evitando quebras se um arquivo estiver faltando.
 3. **Modernidade:** Substituição de hacks de terminal (`t_SI`) por configurações nativas (`guicursor`).

---

## 📚 Referências e Documentação

### 📘 Neovim Lua (Para a sua Config Manual)
 * **[Nvim Lua Guide (Nanotee)](https://github.com/nanotee/nvim-lua-guide)** - **A Bíblia.** O guia definitivo para migrar de Vimscript para Lua. Explica `vim.opt`, `vim.api`, `vim.keymap` em detalhes.
 * **[Lua 5.1 Manual (Quick Reference)](https://www.lua.org/manual/5.1/)** - O manual da versão exata que o Neovim usa (LuaJIT é 5.1 compatível).
 * **[Learn Lua in Y Minutes](https://learnxinyminutes.com/docs/lua/)** - Sintaxe rápida da linguagem para quem já sabe programar.

### ⚡ LazyVim (Para o Script de Instalação)
 * **[LazyVim Docs](https://www.lazyvim.org/)** - Documentação oficial.
 * **[LazyVim Keymaps](https://www.lazyvim.org/keymaps)** - Lista de atalhos padrão (a "barra de espaço" como líder, janelas, buffers).
 * **[LazyVim Plugins](https://www.lazyvim.org/plugins)** - Explica como ativar/desativar plugins extras (ex: TypeScript, Python) sem quebrar o core.

### 🛠️ Ecossistema & Internals
 * **[Mason.nvim](https://github.com/williamboman/mason.nvim)** - Entenda como o Neovim gerencia binários externos (LSP, Linters). *Nota: É por causa dele que você precisa de Node.js/NPM instalados.*
 * **[Nvim-Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Documentação do motor de syntax highlighting moderno.
 * **[Nerd Fonts](https://www.nerdfonts.com/cheat-sheet)** - Buscador de ícones (útil para customizar a statusline ou ícones de arquivos).

### 🎓 Vim "Hard Mode" (Conceitos Core)
 * **[Vim Galore](https://github.com/mhinz/vim-galore)** - Uma enciclopédia de dicas avançadas do Vim que funcionam no Neovim.
 * **[Vim Text Objects](https://www.google.com/search?q=https://blog.carbonfive.com/vim-text-objects-the-definitive-guide/)** - Para entender o poder de editar com `ciw`, `di(`, `vat`, etc.
 * **[Vim Casts](http://vimcasts.org/)** - Vídeos curtos ensinando conceitos fundamentais de edição modal.

---

## Instalar as Dependências no Ubuntu/Debian
 ```bash
 sudo apt install --yes nvim
 sudo apt install --yes xsel
 sudo apt install --yes xclip
 sudo apt install --yes wl-clipboard
 sudo apt install --yes libtree-sitter0
 sudo apt install --yes libtree-sitter-dev
 sudo apt install --yes build-essential
 sudo apt install --yes repgrep
 sudo apt install --yes ripgrep
 sudo apt install --yes fd-find
 sudo apt install --yes git

 sudo apt install --yes nodejs
 sudo apt install --yes npm
 sudo ln -s "$(which fdfind)" "/usr/local/bin/fd" 2> "/dev/null"
 ```

## Instalar as Dependências no Manjaro/Arch
 ```bash
 sudo pacman --needed --noconfirm -S nvim
 sudo pacman --needed --noconfirm -S xsel
 sudo pacman --needed --noconfirm -S xclip
 sudo pacman --needed --noconfirm -S wl-clipboard
 sudo pacman --needed --noconfirm -S tree-sitter
 sudo pacman --needed --noconfirm -S base-devel
 sudo pacman --needed --noconfirm -S repgrep
 sudo pacman --needed --noconfirm -S ripgrep
 sudo pacman --needed --noconfirm -S fd
 sudo pacman --needed --noconfirm -S git

 sudo pacman --needed --noconfirm -S nodejs
 sudo pacman --needed --noconfirm -S npm
 ```

## Instalação Rápida do LazyVim com Configuração Básica
 ```bash
 # Remove Lixo
 rm -rf "$HOME/.config/nvim" 2> "/dev/null"

 # Setup LazyVim
 git clone "https://github.com/LazyVim/starter" "$HOME/.config/nvim"
 rm -rf "$HOME/.config/nvim/.git"

 # Setup Nerd Icons
 wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip" -O "NerdFontsSymbolsOnly.zip"
 unzip -o "NerdFontsSymbolsOnly.zip" -d "$HOME/.local/share/fonts"
 rm -f "$HOME/.local/share/fonts/10-nerd-font-symbols.conf"
 rm -f "$HOME/.local/share/fonts/LICENSE"
 rm -f "$HOME/.local/share/fonts/README.md"
 rm "NerdFontsSymbolsOnly.zip"

 # Install JetBrains Mono
 bash -c "$(curl -fsSL "https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh")"
 wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" -O "JetBrainsMono.zip"
 unzip JetBrainsMono.zip -d "$HOME/.local/share/fonts"
 rm -f "$HOME/.local/share/fonts/OFL.txt"
 rm -f "$HOME/.local/share/fonts/README.md"
 rm -f JetBrainsMono.zip
 fc-cache -fv

 # Setup options.lua
 cat << 'EOF' | tee -a "$HOME/.config/nvim/lua/config/options.lua" > "/dev/null"
 -- Ativar Cursor Piscante
 local cursor_gui = vim.api.nvim_get_option_value("guicursor", {})
 local cursor_group = vim.api.nvim_create_augroup('ConfigCursor', { clear = true })
 vim.api.nvim_create_autocmd({ 'VimEnter', 'VimResume' }, {
 	group = cursor_group,
 	pattern = '*',
 	command = 'set guicursor=' .. cursor_gui .. ',a:blinkwait500-blinkoff500-blinkon500-Cursor/lCursor'
 })
 vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
 	group = cursor_group,
 	pattern = '*',
 	command = 'set guicursor='
 })
 EOF
 ```
