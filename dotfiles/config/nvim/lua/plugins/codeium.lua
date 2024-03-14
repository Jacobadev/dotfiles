return {
    {
        "nvim-lualine/lualine.nvim",
        optional = true,
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, 2, require("lazyvim.util").lualine.cmp_source("codeium"))
        end,
    },
    {
        "nvim-cmp",
        dependencies = {
            {
                "Exafunction/codeium.nvim",
                cmd = "Codeium",
                build = ":Codeium Auth",
                opts = {},
            },
        },
        opts = {

            completion = {
                completeopt = "menu,menuone,noselect",
            },
            mapping = {},
            sources = {
                { name = "codeium", priority = 100 },
            },
        },
    },
}
