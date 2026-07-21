local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config('*', { capabilities = capabilities })

vim.lsp.enable 'oxfmt'
vim.lsp.enable 'oxlint'

vim.lsp.enable 'lua_ls'
vim.lsp.enable 'ts_ls'
vim.lsp.enable 'tsgo'

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = true },
  underline = { severity = vim.diagnostic.severity.ERROR },
  update_in_insert = true,
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
  vim.diagnostic.open_float()

  vim.api.nvim_create_autocmd('CursorMoved', {
    group = vim.api.nvim_create_augroup('line-diagnostics', { clear = true }),
    callback = function()
      vim.diagnostic.config { virtual_lines = false, virtual_text = true }
      return true
    end,
  })
end, { desc = '[g]et [d]iagnostic of line' })

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover { anchor_bias = 'above' }
end, { desc = 'LSP hover' })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

-- Find references for the word under your cursor.
map('grr', Snacks.picker.lsp_references, '[G]oto [R]eferences')
map('gri', Snacks.picker.lsp_implementations, '[G]oto [I]mplementation')
map('grd', Snacks.picker.lsp_definitions, '[G]oto [D]efinition')
map('gO', Snacks.picker.lsp_symbols, 'Open Document Symbols')
map('gW', Snacks.picker.lsp_workspace_symbols, 'Open Workspace Symbols')
map('grt', Snacks.picker.lsp_type_definitions, '[G]oto [T]ype Definition')
map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
