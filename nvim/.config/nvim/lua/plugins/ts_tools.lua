return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    require('typescript-tools').setup {
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
