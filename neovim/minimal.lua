-- ============================================================================
--  MINIMAL SETUP (minimal.lua) - Foco: Compatibilidade e Resgate
-- ============================================================================

-- --- Core ---
vim.opt.compatible = false
vim.opt.number = true
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showcmd = true

-- --- Interface Básica ---
vim.opt.encoding = "utf-8"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.history = 100
vim.opt.backup = false
vim.opt.swapfile = false

-- --- Busca ---
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- --- Indentação Genérica (Segura) ---
vim.opt.autoindent = true
vim.opt.smartindent = true

-- --- Mapeamentos Básicos (Limpeza) ---
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
