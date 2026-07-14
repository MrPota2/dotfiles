-- Very silly
return {
  'aikhe/wrapped.nvim',
  enabled = 'false',
  dependencies = { 'nvzone/volt' },
  cmd = { 'WrappedNvim' },
  opts = {
    path = vim.fn.stdpath 'config',
    nvim_root = 'nvim',
  },
}
