
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = {
                "gd",
                function()
                    -- DO NOT RESUSE WINDOW
                    require("telescope.builtin").lsp_definitions({ reuse_win = false })
                end,
                desc = "Goto Definition",
                has = "definition",
            }
        end,

 opts = {},
        settings = {
            complete_function_calls = true,

            expose_as_code_action = "all",
            separate_diagnostic_server = true,
            organizeImportsIgnoreCase = true,
            importModuleSpecifierPreference = "non-relative",
            importModuleSpecifierEnding = "minimal",
            tsserver_file_preferences = {

                includeInlayParameterNameHints = "all",
                includeCompletionsForModuleExports = true,
                includeInlayVariableTypeHints = true,
                jsxAttributeCompletionStyle = "none",
            },
            tsserver_format_options = {
                quotePreference = "double",
                allowAutoRename = true,
                allowFormatOnSave = true,
                allowIncompleteCompletions = false,
                allowRenameOfImportPath = true,
            },
        },

