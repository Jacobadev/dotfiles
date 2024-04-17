return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    event = { "BufRead", "BufNewFile" },

    config = function()
        require("typescript-tools").setup({
            settings = {

                tsserver_file_preferences = {

                    expose_as_code_action = "all",
                    separate_diagnostic_server = true,
                    organizeImportsIgnoreCase = true,
                    importModuleSpecifierPreference = "non-relative",
                    importModuleSpecifierEnding = "minimal",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                    quotePreference = "auto",
                    includeInlayParameterNameHints = "all",
                    includeCompletionsForModuleExports = true,
                    jsxAttributeCompletionStyle = "braces",
                },
                tsserver_format_options = {
                    quotePreference = "double",
                    allowAutoRename = true,
                    allowFormatOnSave = true,
                    allowIncompleteCompletions = false,
                    allowRenameOfImportPath = true,
                },
            },
        })
        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWritePre", {
            pattern = "*.ts,*.tsx,*.jsx,*.js",
            callback = function(args)
                vim.cmd("TSToolsAddMissingImports sync")
                vim.cmd("TSToolsOrganizeImports sync")
                vim.cmd("TSToolsRemoveUnused sync")
            end,
        })
    end,
}
