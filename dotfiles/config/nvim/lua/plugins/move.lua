return {
    {
        "fedepujol/move.nvim",
        config = function()
            local opts = { noremap = true, silent = true }
            require("move").setup({})
            vim.keymap.set("v", "<S-j>", ":MoveBlock(1)<CR>", opts)
            vim.keymap.set("v", "<S-k>", ":MoveBlock(-1)<CR>", opts)
            vim.keymap.set("v", "<S-h>", ":MoveHBlock(-1)<CR>", opts)
            vim.keymap.set("v", "<S-l>", ":MoveHBlock(1)<CR>", opts)
        end,
    },
}
