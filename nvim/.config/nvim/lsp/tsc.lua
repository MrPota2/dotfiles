---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.ts_ls
  settings = {
    ['js/ts'] = {
      autoClosingTags = { enabled = true },
      preferences = {
        importModuleSpecifier = 'non-relative',
        renameMatchingJsxTags = true
      }
    }
  },
}
