---@type LazySpec
return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { "lua_ls", "rust_analyzer", "oxfmt", "oxlint", "ts_ls", "tsgo" }
    },
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = {},
      },
    }
  }
}
