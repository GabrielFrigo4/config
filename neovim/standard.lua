-- ============================================================================
--  STANDARD SETUP (standard.lua) - Foco: Edição Confortável
-- ============================================================================

-- --- Carrega configurações do Minimal ---
pcall(require, "minimal")

-- --- Visual & Cores ---
vim.opt.termguicolors = true
vim.cmd.colorscheme("habamax")
vim.opt.cursorline = true
vim.opt.wrap = false

-- --- Numeração Híbrida ---
vim.opt.number = true
vim.opt.relativenumber = true

-- --- Mouse & Clipboard ---
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

-- --- Formatação de Texto (Padrão 4 espaços) ---
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- --- Cursor Dinâmico ---
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
