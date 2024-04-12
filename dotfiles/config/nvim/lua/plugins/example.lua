-- since this is just an example spec, don't actually load anything here and return an empty spec
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
        keys = {
            -- add a keymap to browse plugin files
            {
                "<leader>fP",
                function()
                    require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
                end,
                desc = "Find Plugin File",
            },
        },
        -- change some options
        opts = {
            layout_strategy = "horizontal",
            layout_config = { prompt_position = "top" },
            sorting_strategy = "ascending",
            winblend = 0,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {

            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
                "go",
            },
            auto_install = true,
        },
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
            },
        },
    },
}
