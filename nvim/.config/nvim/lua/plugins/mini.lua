return {
    {
        'nvim-mini/mini.files',
        version = '*',
        config = function()
            local mini_files = require 'mini.files'
            mini_files.setup()

            vim.keymap.set('n', '-', function()
                mini_files.open(vim.api.nvim_buf_get_name(0))
            end, { desc = 'Toggle mini file explorer' })
        end,
    },
    {
        'nvim-mini/mini.clue',
        version = '*',
        priorityy = 100,
        enabled = true,
        config = function()
            local miniclue = require 'mini.clue'
            miniclue.setup {
                windows = {
                    delay = 100,
                },
                triggers = {
                    -- Leader triggers
                    { mode = { 'n', 'x' }, keys = '<Leader>' },

                    -- `[` and `]` keys
                    { mode = 'n',          keys = '[' },
                    { mode = 'n',          keys = ']' },

                    -- Built-in completion
                    { mode = 'i',          keys = '<C-x>' },

                    -- `g` key
                    { mode = { 'n', 'x' }, keys = 'g' },

                    -- Marks
                    { mode = { 'n', 'x' }, keys = "'" },
                    { mode = { 'n', 'x' }, keys = '`' },

                    -- Registers
                    { mode = { 'n', 'x' }, keys = '"' },
                    { mode = { 'i', 'c' }, keys = '<C-r>' },

                    -- Window commands
                    { mode = 'n',          keys = '<C-w>' },

                    -- `z` key
                    { mode = { 'n', 'x' }, keys = 'z' },
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.square_brackets(),
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                },
            }
        end,
    },

    {
        'nvim-mini/mini.completion',
        enabled = false,
        config = function()
            local mini_completion = require 'mini.completion'
            mini_completion.setup {
                lsp_completion = {
                    auto_setup = true,
                    process_items = function(items, base)
                        return mini_completion.default_process_items(items, base, { filtersort = 'fuzzy' })
                    end,
                },
            }
            vim.keymap.set('i', '<Tab>', function()
                if vim.fn.pumvisible() == 1 then
                    return '<C-y>'
                end
                return '<Tab>'
            end, { expr = true, desc = 'Accept completion' })
        end,
    },
    {
        'nvim-mini/mini.icons',
        version = '*',
        config = function()
            local mini_icons = require 'mini.icons'
            mini_icons.setup()
            mini_icons.tweak_lsp_kind 'prepend'
            mini_icons.mock_nvim_web_devicons()
        end,
    },
    {
        'nvim-mini/mini.snippets',
        version = '*',
        enabled = true,
        config = function()
            local mini_snippets = require 'mini.snippets'
            local gen_loader = mini_snippets.gen_loader
            require('mini.snippets').setup {
                snippets = {
                    gen_loader.from_file '~/.config/nvim/snippets/global.json',
                    gen_loader.from_lang(),
                },
                expand = {
                    insert = function(snippet)
                        mini_snippets.default_insert(snippet, { empty_tabstop = '' })
                    end,
                },
            }
        end,
    },
    {
        'nvim-mini/mini.ai',
        version = '*',
        config = function()
            require('mini.ai').setup()
        end,
    },
    {
        'nvim-mini/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup()
        end,
    },
    {
        'nvim-mini/mini.statusline',
        version = '*',
        opts = {},
        config = function()
            local statusline = require 'mini.statusline'
            statusline.setup({
                use_icons = vim.g.have_nerd_font,
                content = {
                    active = function()
                        local check_macro_recording = function()
                            if vim.fn.reg_recording() ~= "" then
                                return "Recording @" .. vim.fn.reg_recording()
                            else
                                return ""
                            end
                        end

                        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                        local git = MiniStatusline.section_git({ trunc_width = 40 })
                        local diff = MiniStatusline.section_diff({ trunc_width = 75 })
                        local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                        -- local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
                        local filename = MiniStatusline.section_filename({ trunc_width = 140 })
                        local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                        local location = MiniStatusline.section_location({ trunc_width = 200 })
                        local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
                        local macro = check_macro_recording()

                        return MiniStatusline.combine_groups({
                            { hl = mode_hl,                 strings = { mode } },
                            { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
                            "%<", -- Mark general truncate point
                            { hl = "MiniStatuslineFilename", strings = { filename } },
                            "%=", -- End left alignment
                            { hl = "MiniStatuslineFilename", strings = { macro } },
                            { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                            { hl = mode_hl,                  strings = { search, location } },
                        })
                    end,
                },
            })
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return '%l(%L)—|%v(%-{virtcol("$") - 1})'
            end
        end,
    },
    {
        'nvim-mini/mini.map',
        version = '*',
        config = function()
            local map = require 'mini.map'
            map.setup {
                integrations = {
                    map.gen_integration.diagnostic(),
                    map.gen_integration.builtin_search(),
                    map.gen_integration.gitsigns(),
                },
            }
            map.open()
        end,
    },
}
