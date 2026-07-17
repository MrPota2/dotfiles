---@type vim.lsp.Config
return {
  cmd = { 'npx', 'tsc', '--stdio' },
  settings = {
    typescript = {
      autoClosingTags = true,
      preferences = {
        importModuleSpecifierPreference = 'non-relative'
      }
    }
  },
}
