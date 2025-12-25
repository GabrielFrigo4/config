" =============================================================================
" STANDARD SETUP (standard.vim) - Foco: Edição Confortável
" =============================================================================

" --- Carrega configurações do Minimal ---
source <sfile>:h/minimal.vim 

" --- Visual & Cores ---
set termguicolors
colorscheme habamax
set cursorline
set nowrap

" --- Numeração Híbrida ---
set number
set relativenumber

" --- Mouse & Clipboard ---
set mouse=a
set mousemodel=popup
try
    set clipboard^=unnamed,unnamedplus
catch
endtry

" --- Formatação de Texto (Padrão 4 espaços) ---
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" --- Cursor Dinâmico ---
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"
