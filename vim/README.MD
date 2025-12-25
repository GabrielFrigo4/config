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
 cat << 'EOF' > "$HOME/.vimrc"
 syn on|filetype plugin indent on
 se nocp nu ls=2 sc enc=utf-8 bs=2 ww+=<,>,h,l,[,] hi=256 nobk noswf hls is ai si
 EOF
 ```

### Nível 2: Standard (Daily Driver)
 ```bash
 cat << 'EOF' > "$HOME/.vimrc"
 syn on|filetype plugin indent on
 se nocp nu rnu ls=2 sc enc=utf-8 bs=2 ww+=<,>,h,l,[,] hi=256 nobk noswf hls is ai si
 se tgc cul nowrap mouse=a mousemodel=popup ts=4 sts=4 sw=4 et
 try|se cb^=unnamed,unnamedplus|colo habamax|catch|endtry
 let &t_SI="\<Esc>[5 q"|let &t_SR="\<Esc>[3 q"|let &t_EI="\<Esc>[1 q"
 EOF
 ```

### Nível 3: Ultimate (Pro IDE)
 ```bash
 cat << 'EOF' > "$HOME/.vimrc"
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
