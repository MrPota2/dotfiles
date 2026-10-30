return {
  'GustavEikaas/easy-dotnet.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'folke/snacks.nvim', 'mfussenegger/nvim-dap' },
  config = function()
    require('easy-dotnet').setup {
      config =
      { capabilities =
      { workspace =
      { didChangeWatchedFiles =
      { dynamicRegistration = true } } } }, lsp = { preload_roslyn = false } }
  end,
}
