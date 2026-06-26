return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.git' },
  settings = {
    Lua = { completion = {
      keywordSnippet = 'Disable',
      workspaceWord = false,
    }, diagnostics = { globals = { 'vim' } } },
  },
}
