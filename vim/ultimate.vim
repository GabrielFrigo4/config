" =============================================================================
" ULTIMATE SETUP (ultimate.vim) - Foco: Power User
" =============================================================================

" Carrega configurações do Standard
source <sfile>:h/standard.vim 

" --- Melhorias de UX ---
set wildmenu
set wildmode=longest:full,full
set scrolloff=8
set signcolumn=yes
set splitbelow splitright

" --- Busca Inteligente ---
set ignorecase
set smartcase

" --- Mappings Avançados ---
let mapleader = "\<Space>"
nnoremap <expr> <Backspace> col('.') == 1 ? 'kgJ' : 'X'

" Facilitadores
nnoremap <Space> <Nop>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" --- Autocomandos (Linguagens) ---
augroup LanguageConfig
    autocmd!
    
    autocmd FileType javascript,typescript,javascriptreact,typescriptreact,lua,html,css,json,yaml 
        \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

    autocmd FileType python,org 
        \ setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab autoindent

    autocmd FileType c,cpp,rust,cs,java,zig,arduino 
        \ setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

    autocmd FileType go,asm,nasm,masm,fasm 
        \ setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

augroup END