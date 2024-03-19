-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her

local opts = { noremap = true, silent = true }
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

vim.keymap.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end, opts)
vim.keymap.set("n", "<C-k>", function()
    vim.diagnostic.goto_prev()
end, opts)

vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
    harpoon:list():append()
end)
vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-f>", function()
    harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-g>", function()
    harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
    harpoon:list():select(3)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
    harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
    harpoon:list():next()
end)
