" =============================================================================
" MINIMAL SETUP (minimal.vim) - Foco: Compatibilidade e Resgate
" =============================================================================

" --- Core ---
set nocompatible
filetype plugin indent on
syntax on

" --- Interface Básica ---
set number
set ruler
set laststatus=2
set showcmd

" --- Comportamento (Seguro) ---
set encoding=UTF-8
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set history=256
set nobackup
set noswapfile

" --- Busca ---
set hlsearch
set incsearch

" --- Indentação Genérica (Segura) ---
set autoindent
set smartindent
