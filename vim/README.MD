# Vim Configuration (Tiered Setup)
 Esta é uma configuração modular do Vim projetada para escalar desde ambientes hostis (servidores antigos) até um ambiente de desenvolvimento completo.

## 📂 Estrutura dos Arquivos
 A configuração é dividida em três níveis de complexidade. Cada nível herda do anterior:

### 1. `minimal.vim` (Rescue Mode)
 * **Foco:** Compatibilidade máxima e servidores remotos via SSH.
 * **Características:**
     * Sem plugins, sem cores `termguicolors`.
     * Funciona em versões antigas do Vim.
     * Configurações de segurança (sem backup/swap).
     * Ideal para: `root`, servidores legacy, Docker containers.

### 2. `standard.vim` (Daily Driver)
 * **Foco:** Edição confortável e visual agradável.
 * **Herda de:** `minimal.vim`
 * **Características:**
     * Ativa `termguicolors` e colorscheme (Evening).
     * Suporte a Mouse e Clipboard do sistema.
     * Numeração híbrida (relativa + absoluta).
     * Indentação padrão (4 espaços).

### 3. `ultimate.vim` (Pro / IDE)
 * **Foco:** Produtividade máxima e desenvolvimento de software.
 * **Herda de:** `standard.vim`
 * **Características:**
     * **Mappings Avançados:** `Space` como Leader key, Backspace inteligente.
     * **Linguagens:** Configuração granular de indentação:
         * *Web/Lua:* 2 espaços.
         * *C/C++/Rust/C#:* 4 espaços.
         * *Go/Assembly/Python:* Tabs reais (`noexpandtab`).
     * **UX:** Menus melhores (`wildmenu`), split inteligente.

---

## ⚡ Quick Setup (One-Liners)
 Se você não quiser clonar o repositório ou precisar configurar um servidor rapidamente, copie e cole um dos blocos abaixo no seu terminal. Eles geram um `.vimrc` funcional instantaneamente.

### Nível 1: Minimal (Rescue)
 ```bash
 cat << 'EOF' | tee "$HOME/.vimrc" > "/dev/null"
 syn on|filetype plugin indent on
 se nocp nu ls=2 sc enc=utf-8 bs=2 ww+=<,>,h,l,[,] hi=256 nobk noswf hls is ai si
 EOF
 ```

### Nível 2: Standard (Daily Driver)
 ```bash
 cat << 'EOF' | tee "$HOME/.vimrc" > "/dev/null"
 syn on|filetype plugin indent on
 se nocp nu rnu ls=2 sc enc=utf-8 bs=2 ww+=<,>,h,l,[,] hi=256 nobk noswf hls is ai si
 se tgc cul nowrap mouse=a mousemodel=popup ts=4 sts=4 sw=4 et
 try|se cb^=unnamed,unnamedplus|colo habamax|catch|endtry
 let &t_SI="\<Esc>[5 q"|let &t_SR="\<Esc>[3 q"|let &t_EI="\<Esc>[1 q"
 EOF
 ```

### Nível 3: Ultimate (Pro IDE)
 ```bash
 cat << 'EOF' | tee "$HOME/.vimrc" > "/dev/null"
 syn on|filetype plugin indent on
 se nocp nu rnu ls=2 sc enc=utf-8 bs=2 ww+=<,>,h,l,[,] hi=256 nobk noswf hls is ai si
 se tgc cul nowrap mouse=a mousemodel=popup ts=4 sts=4 sw=4 et
 se wmnu wim=longest:full,full so=8 scl=yes sb spr ic scs
 try|se cb^=unnamed,unnamedplus|colo habamax|catch|endtry
 au FileType javascript,typescript,javascriptreact,typescriptreact,lua,html,css,json,yaml setl ts=2 sw=2 sts=2 et
 au FileType python,org,go,asm,nasm,masm,fasm setl ts=4 sw=4 sts=4 noet
 au FileType c,cpp,rust,cs,java,zig,arduino setl ts=4 sw=4 sts=4 et
 let mapleader="\<Space>"|nn <space> <nop>|nn <leader>w :w<cr>|nn <leader>q :q<cr>
 nn <expr> <BS> col('.')==1?'kgJ':'X'
 let &t_SI="\<Esc>[5 q"|let &t_SR="\<Esc>[3 q"|let &t_EI="\<Esc>[1 q"
 EOF
 ```

---

## 🚀 Instalação e Uso (Arquivos)

### Opção A: Carregamento Manual (Recomendado)
 No seu arquivo `~/.vimrc` principal, carregue apenas o nível que deseja utilizar no momento.

 Para usar a versão completa:
 ```vim
 " ~/.vimrc
 source ~/vimfiles/vimrc/ultimate.vim
 ```

 Para usar a versão leve em um servidor:
 ```vim
 " ~/.vimrc
 source ~/vimfiles/vimrc/minimal.vim
 ```

### Opção B: Seleção Dinâmica
 Você pode colocar isso no seu `.vimrc` para carregar baseada no hostname ou em uma variável de ambiente:

 ```vim
 if exists('$VIM_MINIMAL')
     source ~/vimfiles/vimrc/minimal.vim
 else
     source ~/vimfiles/vimrc/ultimate.vim
 endif
 ```

## 📍 Caminhos
 * **Repositório:** `~/vimfiles/vimrc`
 * **Vimrc do Usuário:** `~/.vimrc`

---

## 📚 Referências e Documentação

### 🚀 SpaceVim (O Framework)
 * **[SpaceVim Documentation](https://spacevim.org/documentation/)** - O manual oficial. Essencial para entender como as "Layers" funcionam (o equivalente aos Módulos do Doom).
 * **[SpaceVim Layers](https://spacevim.org/layers/)** - Catálogo de plugins agrupados. Quer suporte a Python? Ative a layer `lang#python`.
 * **[SpaceVim General Options](https://www.google.com/search?q=https://spacevim.org/documentation/%23general-options)** - Lista de opções para colocar no seu `init.toml`.

### 🧠 Core Vim
 * [Vim Documentation](https://vimhelp.org/)
 * [Vim Tips Wiki](http://vim.wikia.com/wiki/Vim_Tips_Wiki)
 * [Vimcasts](http://vimcasts.org/)

### ⚙️ Configuração (TOML & VimScript)
 * **[TOML Guide](https://toml.io/en/)** - O SpaceVim usa TOML para a configuração principal (`init.toml`). É bom entender a sintaxe.
 * **[Vim Script Cheat Sheet](https://devhints.io/vimscript)** - Embora o SpaceVim abstraia muito, para funções customizadas (`bootstrap_before`) você usará VimScript puro.
 * **[Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)** - Se quiser se aprofundar no que roda "por baixo do capô" do Vim clássico.

---

## Instalar as Dependências no Ubuntu/Debian
 ```bash
 sudo apt install --yes vim
 sudo apt install --yes vim-nox
 sudo apt install --yes xsel
 sudo apt install --yes xclip
 sudo apt install --yes wl-clipboard
 sudo apt install --yes repgrep
 sudo apt install --yes ripgrep
 sudo apt install --yes fd-find
 sudo apt install --yes git
 sudo ln -s "$(which fdfind)" "/usr/local/bin/fd" 2> "/dev/null"
 ```

## Instalar as Dependências no Manjaro/Arch
 ```bash
 sudo pacman --needed --noconfirm -S vim
 sudo pacman --needed --noconfirm -S xsel
 sudo pacman --needed --noconfirm -S xclip
 sudo pacman --needed --noconfirm -S wl-clipboard
 sudo pacman --needed --noconfirm -S repgrep
 sudo pacman --needed --noconfirm -S ripgrep
 sudo pacman --needed --noconfirm -S fd
 sudo pacman --needed --noconfirm -S git
 ```

## Instalação Rápida do SpaceVim com Configuração Básica
 ```bash
 # Remove Lixo
 rm -rf "$HOME/.vim" 2> "/dev/null"
 rm -rf "$HOME/.vimrc" 2> "/dev/null"
 rm -rf "$HOME/.SpaceVim" 2> "/dev/null"
 rm -rf "$HOME/.SpaceVim.d" 2> "/dev/null"

 # Setup SpaceVim
 git clone "https://github.com/SpaceVim/SpaceVim.git" "$HOME/.SpaceVim"
 mkdir -p "$HOME/.SpaceVim.d/autoload"

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
 unzip -o JetBrainsMono.zip -d "$HOME/.local/share/fonts"
 rm -f "$HOME/.local/share/fonts/OFL.txt"
 rm -f "$HOME/.local/share/fonts/README.md"
 rm -f JetBrainsMono.zip
 fc-cache -f

 # Setup init.toml
 cat << 'EOF' | tee "$HOME/.SpaceVim.d/init.toml" > "/dev/null"
 # =============================================================================
 # Opções Gerais
 # =============================================================================
 [options]
    # Define a fonte (Importante para GUIs, mas ajuda na detecção de ícones)
    guifont = "JetBrainsMonoNL Nerd Font Mono:h16"
   
    # Tema
    colorscheme = "onedark"
    colorscheme_bg = "dark"
   
    # Statusline e Ícones
    enable_statusline_mode = true
    statusline_separator = "arrow"
    enable_tabline_filetype_icon = true
    enable_bufferline = true
   
    # Aponta para a função de bootstrap (onde configuramos o cursor)
    bootstrap_before = "myspacevim#before"

 # =============================================================================
 # Layers (Plugins)
 # =============================================================================
 [[layers]]
    name = "autocomplete"
    auto_completion_return_key_behavior = "complete"
    auto_completion_tab_key_behavior = "smart"

 [[layers]]
    name = "shell"
    default_position = "bottom"
    default_height = 30

 [[layers]]
    name = "git"

 [[layers]]
    name = "lsp"
 EOF

 # Setup myspacevim.vim
 cat << 'EOF' | tee "$HOME/.SpaceVim.d/autoload/myspacevim.vim" > "/dev/null"
 function! myspacevim#before() abort
    " Ativar Cursor Piscante (Força configurações de terminal)
    let &t_SI = "\e[6 q"
    let &t_SR = "\e[4 q"
    let &t_EI = "\e[2 q"
   
    " Configura o comportamento do cursor para Block/Line
    set guicursor+=n-v-c:blinkon1
    set guicursor+=i-ci:ver25-blinkon1
 endfunction
 EOF
 ```
