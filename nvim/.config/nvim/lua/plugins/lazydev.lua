return {
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        'lazy.nvim',
        'nvim-lspconfig',
        { path = 'snacks.nvim', words = { 'Snacks' } },
        { path = 'mini', words = { 'mini' } },
        { path = 'blink.cmp', words = { 'blink' } },
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
