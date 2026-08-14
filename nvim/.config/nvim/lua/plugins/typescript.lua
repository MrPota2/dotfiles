return {
  'peitalin/vim-jsx-typescript',
  { 'windwp/nvim-ts-autotag', lazy = false, opts = {} },
  {
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
          tsserver_file_preferences = {
            code_lens = 'none',
            includeInlayParameterNameHints = 'none',
            includeCompletionsForModuleExports = false,
            importModuleSpecifierPreference = 'non-relative',
          },
        },
      }
    end,
  },
}
