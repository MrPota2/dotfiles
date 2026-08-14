---@type LazySpec
return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { "lua_ls", "rust_analyzer", "oxfmt", "oxlint", "ts_ls", "tsgo" },
      automatic_enable = false

    },
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = {},
      },
    }
  }
}
