---@type LazySpec
return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { "lua_ls", "rust_analyzer", "oxfmt", "oxlint", "typescript-language-server" }
    },
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = {},
      },
    }
  }
}
