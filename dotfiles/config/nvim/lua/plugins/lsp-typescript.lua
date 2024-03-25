return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("typescript-tools").setup({
            settings = {

                tsserver_file_preferences = {
                    importModuleSpecifierPreference = "non-relative",
                },
            },
        })

        local autocmd = vim.api.nvim_create_autocmd

        autocmd("BufWritePre", {
            pattern = "*.ts,*.tsx",
            callback = function(args)
                -- Check if commands exist before execution (improved efficiency)
                local success, err_msg = pcall(vim.cmd, "execute 'TSToolsAddMissingImports sync'")
                if success then
                    vim.cmd("TSToolsAddMissingImports sync")
                else
                    -- Optional: Log or handle errors gracefully (e.g., print a message)
                    print("Error executing TSToolsAddMissingImports:", err_msg)
                end

                success, err_msg = pcall(vim.cmd, "execute 'TSToolsOrganizeImports sync'")
                if success then
                    vim.cmd("TSToolsOrganizeImports sync")
                else
                    -- Handle errors as needed
                    print("Error executing TSToolsOrganizeImports:", err_msg)
                end

                -- Add similar checks and execution for other commands (avoid repetition)
                local commands = {
                    "TSToolsAddMissingImports",
                    "TSToolsOrganizeImports",
                }
                for _, cmd in ipairs(commands) do
                    success, err_msg = pcall(vim.cmd, "execute '" .. cmd .. " sync'")
                    if success then
                        vim.cmd(cmd .. " sync")
                    else
                        -- Handle errors as needed
                        print("Error executing", cmd, ":", err_msg)
                    end
                end
            end,
        })
    end,
}
