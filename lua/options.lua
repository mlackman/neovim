-- nvim-tree succests disabling netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.g.python3_host_prog = "/Users/mlackman/.pyenv/shims/python3"
vim.g.python3_host_prog = '/Users/mlackman/projects/neovim-plugins/.venv/bin/python3'

vim.opt.number = false  -- show line numbers
vim.opt.clipboard = "unnamedplus"  -- system clipboard synced with neovim

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.virtualedit = "block"  -- allows CTRL-V visual block mode to go beyond end of the line
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true

vim.keymap.set("i","jk","<esc>",{noremap=true})
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true, desc = 'Open diagnostic float' })

vim.lsp.enable('pyright')
-- vim.lsp.enable('kotlin_lsp')
-- vim.lsp.config('kotlin_lsp', {
--     single_file_support = false,
-- })
--


