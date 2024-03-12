-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })

vim.keymap.set("x", "<leader>re", function()
    require("refactoring").refactor("Extract Function")
end, { desc = "Extract Function" })

vim.keymap.set("x", "<leader>rf", function()
    require("refactoring").refactor("Extract Function To File")
end, { desc = "Extract Function To File" })

vim.keymap.set("x", "<leader>rv", function()
    require("refactoring").refactor("Extract Variable")
end, { desc = "Extract Variable" })

vim.keymap.set("n", "<leader>rI", function()
    require("refactoring").refactor("Inline Function")
end, { desc = "Inline Function" })

vim.keymap.set({ "n", "x" }, "<leader>ri", function()
    require("refactoring").refactor("Inline Variable")
end, { desc = "Inline Variable" })

vim.keymap.set("n", "<leader>rb", function()
    require("refactoring").refactor("Extract Block")
end, { desc = "Extract Block" })

vim.keymap.set("n", "<leader>rbf", function()
    require("refactoring").refactor("Extract Block To File")
end, { desc = "Extract Block To File" })

-- Extract block supports only normal mode
-- Extract block supports only normal mode

vim.keymap.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end, opts)
