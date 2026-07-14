---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.git' },
  settings = {
    ---@type _.lspconfig.settings.lua_ls.Lua
    Lua = { completion = {
      keywordSnippet = 'Disable',
      workspaceWord = false,
    }, diagnostics = { globals = { 'vim' } }, format = {} },
  },
}
