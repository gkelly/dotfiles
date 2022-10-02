require('plugins')

vim.api.nvim_command([[
  colorscheme base16-ayu-dark
]])

vim.g.mapleader = '\\'
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>f", ":Telescope find_files<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>g", ":Telescope live_grep<CR>", {noremap = true})

vim.o.autoindent = true
vim.o.autoread = true
vim.o.belloff = "all"
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.shiftwidth = 2
vim.o.showmatch = true
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.wildmode = "longest,list:longest,full"
vim.o.writebackup = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
