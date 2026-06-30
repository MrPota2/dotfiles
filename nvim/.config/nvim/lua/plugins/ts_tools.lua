return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  -- use ts_ls instead as the highlighting for it actually works
  enabled = false,
  opts = {},
  config = function()
    require('typescript-tools').setup {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'never',
      },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      -- optional settings
      tsserver_plugins = {
        '@styled/typescript-styled-plugin',
      },
      settings = {
        tsserver_plugins = {
          '@styled/typescript-styled-plugin',
        },
        expose_as_code_action = 'all',
        tsserver_file_preferences = {
          code_lens = 'all',
          includeInlayParameterNameHints = 'all',
          includeCompletionsForModuleExports = true,
          importModuleSpecifierPreference = 'non-relative',
        },
      },
    }
  end,
}
