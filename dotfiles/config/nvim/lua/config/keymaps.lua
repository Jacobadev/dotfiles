-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her

local silent = { silent = true }
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })

vim.keymap.set("x", "<leader>re", function()
    require("refactoring").refactor("Extract Function")
end)
vim.keymap.set("x", "<leader>rf", function()
    require("refactoring").refactor("Extract Function To File")
end)
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function()
    require("refactoring").refactor("Extract Variable")
end)
-- Extract variable supports only visual mode
vim.keymap.set("n", "<leader>rI", function()
    require("refactoring").refactor("Inline Function")
end)
-- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>ri", function()
    require("refactoring").refactor("Inline Variable")
end)
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function()
    require("refactoring").refactor("Extract Block")
end)
vim.keymap.set("n", "<leader>rbf", function()
    require("refactoring").refactor("Extract Block To File")
end)
vim.keymap.set("n", "x", '"_x', silent)
vim.keymap.set("n", "X", '"_X', silent)
vim.keymap.set("v", "x", '"_x', silent)
vim.keymap.set("v", "X", '"_X', silent)

-- vim.keymap.set("n", "<leader>crr", "<cmd>TSToolsFileReferences<cr>", { desc = "Find File References" })
-- vim.keymap.set("n", "<leader>crn", "<cmd>TSToolsRenameFile<cr>", { desc = "Rename File" })

vim.keymap.set("n", "<leader>rr", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { desc = "Insert if err" })
