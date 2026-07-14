return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = { 'typescript', 'javascript', 'tsx' },
    highlight = {
      enable = true,
    },
  },
  config = function()
    vim.treesitter.language.register('tsx', 'typescriptreact')
  end,
}
