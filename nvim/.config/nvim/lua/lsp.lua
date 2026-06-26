local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('mini.completion').get_lsp_capabilities())

vim.lsp.config('*', { capabilities = capabilities })

-- remember to import the servers here
local servers = {
  lua_ls = require 'lsp.lua_ls',
}

for name, config in pairs(servers) do
  config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})

  vim.lsp.config(name, config)
end
vim.lsp.enable(vim.tbl_keys(servers))

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = true },
  underline = { severity = vim.diagnostic.severity.ERROR },
  update_in_insert = true,
  virtual_lines = { current_line = false },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

-- for LSP related items. It sets the mode, buffer and description for us each time.
local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
end
map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

vim.keymap.set('n', 'gd', function()
  vim.diagnostic.config { virtual_lines = { current_line = true }, virtual_text = false }

  vim.api.nvim_create_autocmd('CursorMoved', {
    group = vim.api.nvim_create_augroup('line-diagnostics', { clear = true }),
    callback = function()
      vim.diagnostic.config { virtual_lines = false, virtual_text = true }
      return true
    end,
  })
end, { desc = '[g]et [d]iagnostic of line' })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

-- Find references for the word under your cursor.
map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

-- Jump to the definition of the word under your cursor.
--  This is where a variable was first declared, or where a function is defined, etc.
--  To jump back, press <C-t>.
map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

-- Fuzzy find all the symbols in your current workspace.
--  Similar to document symbols, except searches over your entire project.
map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
