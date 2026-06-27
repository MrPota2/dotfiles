-- Very silly
return {
  dir = '~/git/wrapped.nvim',
  dependencies = { 'nvzone/volt' },
  cmd = { 'WrappedNvim' },
  opts = {
    path = vim.fn.stdpath 'config',
    nvim_root = 'nvim',
  },
}
