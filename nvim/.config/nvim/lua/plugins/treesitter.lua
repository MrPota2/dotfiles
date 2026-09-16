return {
  'nvim-treesitter/nvim-treesitter',
  enable = "true",
  config = function()
    require('nvim-treesitter').setup()

    require('nvim-treesitter').install({
      'tsx',
      'typescript',
      'javascript',
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'typescript', 'tsx', 'javascript', 'typescriptreact' },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
