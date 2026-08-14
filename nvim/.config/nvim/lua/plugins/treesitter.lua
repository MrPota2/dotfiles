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
  end,
}
