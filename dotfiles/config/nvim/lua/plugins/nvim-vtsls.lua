return {
  {
    "yioneko/nvim-vtsls",
    lazy = true,
    event = "BufEnter",
    config = function()
      -- Function to run vtsls commands
      function RUN_vtsls_commands()
        local clients = vim.lsp.get_clients()
        for _, client in ipairs(clients) do
          if client.name == "vtsls" then
            require("vtsls").commands.organize_imports(0)
            require("vtsls").commands.add_missing_imports(0)
            require("vtsls").commands.remove_unused_imports(0)
            require("vtsls").commands.fix_all(0)
            break
          end
        end
      end

      -- Autocmd to run commands on BufWritePre
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.vue", "*.ts", "*.tsx" },
        callback = function()
          -- Check if the LSP server is ready and run the commands
          vim.defer_fn(function()
            RUN_vtsls_commands()
          end, 100) -- Adjust the delay as needed
        end,
      })
    end,
  },
}
