return {

    { "typescript-language-server", enabled = false },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        event = { "BufRead", "BufNewFile" },

        config = function()
            require("typescript-tools").setup({
                settings = {

                    tsserver_file_preferences = {
                        includeInlayParameterNameHints = "literal",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = false,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                        separate_diagnostic_server = true,
                        organizeImportsIgnoreCase = true,
                        importModuleSpecifierPreference = "non-relative",
                        importModuleSpecifierEnding = "minimal",
                        includeInlayVariableTypeHintsWhenTypeMatchesName = false,

                        includeCompletionsForModuleExports = true,
                        jsxAttributeCompletionStyle = "braces",
                    },
                    tsserver_format_options = {
                        quotePreference = "double",
                        allowFormatOnSave = true,
                        allowIncompleteCompletions = true,
                    },
                },
            })
            local autocmd = vim.api.nvim_create_autocmd
            autocmd("BufWritePre", {
                pattern = "*.ts,*.tsx,*.jsx,*.js",
                callback = function(_)
                    vim.cmd("TSToolsAddMissingImports sync")
                    vim.cmd("TSToolsOrganizeImports sync")
                    vim.cmd("TSToolsRemoveUnused sync")
                end,
            })
        end,
    },
}
