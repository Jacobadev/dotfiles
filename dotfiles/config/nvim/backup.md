
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
