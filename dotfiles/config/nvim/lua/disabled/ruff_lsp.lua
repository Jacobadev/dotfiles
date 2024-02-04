return {
    require("lspconfig").ruff_lsp.setup({
        autostart = false, -- or set to false if it's autostart
        -- other configuration options
    }),
}
