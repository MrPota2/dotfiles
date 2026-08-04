vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = 'split'

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undodir'
vim.opt.undofile = true

vim.opt.clipboard:append 'unnamedplus'
vim.opt.isfname:append '@-@'
vim.opt.scrolloff = 8

vim.opt.colorcolumn = '0'
vim.opt.signcolumn = 'yes'
vim.o.cmdheight = 0
vim.opt.termguicolors = true

vim.opt.completeopt = 'menuone,noinsert,fuzzy,nosort'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function()
    vim.hl.on_yank()
  end,
})
local kitty_window_id = vim.env.KITTY_WINDOW_ID or vim.fn.getpid()

vim.opt.shadafile =
    vim.fn.stdpath('state') .. '/shada/kitty-' .. kitty_window_id .. '.shada'
