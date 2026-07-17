return {
  ---@type lspconfig.settings.ts_ls
  settings = {
    typescript = {
      autoClosingTags = true,
      preferences = {
        importModuleSpecifierPreference = 'non-relative'
      }
    }
  },
}
