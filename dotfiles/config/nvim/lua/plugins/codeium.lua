return {
    {
        "nvim-cmp",
        dependencies = {
            -- codeium
            {
                "Exafunction/codeium.nvim",
                cmd = "Codeium",
                build = ":Codeium Auth",
                opts = {
                    -- Remove the `use` here if you're using folke/lazy.nvim.
                    -- Change '<C-g>' here to any keycode you like.
                    vim.keymap.set("i", "<C-g>", function()
                        return vim.fn["codeium#Accept"]()
                    end, { expr = true, silent = true }),
                    vim.keymap.set("i", "<c-;>", function()
                        return vim.fn["codeium#CycleCompletions"](1)
                    end, { expr = true, silent = true }),
                    vim.keymap.set("i", "<c-,>", function()
                        return vim.fn["codeium#CycleCompletions"](-1)
                    end, { expr = true, silent = true }),
                    vim.keymap.set("i", "<c-x>", function()
                        return vim.fn["codeium#Clear"]()
                    end, { expr = true, silent = true }),
                },
            },
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, 1, {
                name = "codeium",
                group_index = 1,
                priority = 1000,
                keyword_length = 2,
            })
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        optional = true,
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, 2, require("lazyvim.util").lualine.cmp_source("codeium"))
        end,
    },
}
