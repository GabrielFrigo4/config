-- ============================================================================
--  ULTIMATE SETUP (ultimate.lua) - Foco: Power User
-- ============================================================================

-- --- Carrega configurações do Standard ---
pcall(require, "standard")

-- --- Melhorias de UX ---
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true

-- --- Busca Inteligente ---
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- --- Mappings Avançados ---
vim.g.mapleader = " "
vim.keymap.set('n', '<Space>', '<Nop>', { silent = true })

-- --- Facilitadores ---
vim.keymap.set('n', '<Leader>w', '<cmd>w<CR>', { desc = "Salvar" })
vim.keymap.set('n', '<Leader>q', '<cmd>q<CR>', { desc = "Sair" })

vim.keymap.set('n', '<Backspace>', function()
    if vim.fn.col('.') == 1 then
        return 'kgJ'
    else
        return 'X'
    end
end, { expr = true, desc = "Smart Backspace" })

-- --- Autocomandos (Linguagens) ---
local augroup = vim.api.nvim_create_augroup('LanguageConfig', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'javascript', 'typescript', 'lua', 'html', 'css', 'json', 'yaml' },
    group = augroup,
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'python' },
    group = augroup,
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.expandtab = true
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'go', 'asm', 'nasm', 'fasm', 'make' },
    group = augroup,
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = false
    end,
})

-- --- Exclusivo Neovim: Highlight ao Copiar (Yank) ---
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
