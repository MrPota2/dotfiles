return {
  'saghen/blink.cmp',
  dependencies = {
    'saghen/blink.lib',
    -- optional: provides snippets for the snippet source
    'rafamadriz/friendly-snippets',
    'nvim-mini/mini.snippets',
  },
  version = '1.*',
  build = function()
    -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
    -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
    require('blink.cmp').build():pwait()
  end,

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {

    keymap = { preset = 'super-tab' },

    signature = { enabled = true, trigger = { enabled = true, show_on_accept = true, show_on_insert = true }, window = { direction_priority = { 'n' } } },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      ghost_text = {
        enabled = true,
      },
      documentation = { auto_show = true, auto_show_delay_ms = 0 },
      list = {
        selection = { preselect = true, auto_insert = false },
      },
      menu = {
        draw = {
          columns = { { 'kind_icon', gap = 1 }, { 'label', 'label_description', gap = 1 }, { 'kind', gap = 1 }, { 'source_name' } },
          components = {
            kind_icon = {
              text = function(ctx)
                if ctx.source_name ~= 'Path' then
                  return (require('lspkind').symbol_map[ctx.kind] or '') .. ctx.icon_gap
                end

                local is_unknown_type = vim.tbl_contains({ 'link', 'socket', 'fifo', 'char', 'block', 'unknown' }, ctx.item.data.type)
                local mini_icon, _ = require('mini.icons').get(is_unknown_type and 'os' or ctx.item.data.type, is_unknown_type and '' or ctx.label)

                return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
              end,

              highlight = function(ctx)
                if ctx.source_name ~= 'Path' then
                  return ctx.kind_hl
                end

                local is_unknown_type = vim.tbl_contains({ 'link', 'socket', 'fifo', 'char', 'block', 'unknown' }, ctx.item.data.type)
                local mini_icon, mini_hl = require('mini.icons').get(is_unknown_type and 'os' or ctx.item.data.type, is_unknown_type and '' or ctx.label)
                return mini_icon ~= nil and mini_hl or ctx.kind_hl
              end,
            },
          },
        },
      },
    },

    -- (Default) list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"`
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = 'rust', frecency = { enabled = true } },
  },
}
