return {
  'jiaoshijie/undotree',
  opts = {
    -- your options
  },
  opt = {
    function()
      local undotree = require 'undotree'
      vim.keymap('n', '<leader>u', undotree.toggle(), { desc = '[U]ndo tree' })
    end,
  },
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
