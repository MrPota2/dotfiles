-- just vim
vim.g.mapleader = ' '
vim.g.maplocalleader = '<Del>'

-- replaces selected text without replacing yank buffer
vim.keymap.set('x', 'p', [["_dP]], { desc = 'Paste over selection without losing yanked text' })

vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode', noremap = true, silent = true })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove highlights' })

vim.keymap.set('v', '<', '<gv', { desc = 'Unindent and keep selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent and keep selection' })

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Write buffer', nowait = true })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<Up>', ':<Up>', { noremap = true, silent = false, desc = 'Get last command from normal mode' })

-- Plugins/etc
