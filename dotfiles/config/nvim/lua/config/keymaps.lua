-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her
--

local keymap = vim.keymap.set
local silent = { silent = true }

-- Save file by CTRL-S
keymap({ "s", "i", "n", "v" }, "<C-s>", "<esc>:w<cr>", { desc = "Exit insert mode and save changes.", silent = true })
keymap("i", "<C-s>", "<ESC> :w<CR>i", silent)
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)
-- vim.keymap.set("n", "<leader>rr", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { desc = "Insert if err" })
