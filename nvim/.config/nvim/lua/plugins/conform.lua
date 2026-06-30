return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier', 'eslint_d' },
        javascriptreact = { 'prettier', 'eslint_d' },
        typescript = { 'prettier', 'eslint_d' },
        typescriptreact = { 'prettier', 'eslint_d' },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    },
  },
}
