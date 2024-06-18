--
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Add any additional autocmds here
--
-- local autocmd
-- autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("TS_add_missing_imports", { clear = true }),
--   desc = "TS_add_missing_imports",
--   pattern = { "*.ts,*.tsx,*.js,*.jsx" },
--   callback = function()
--     local params = vim.lsp.util.make_range_params()
--     params.context = {
--       only = { "source.addMissingImports.ts" },
--     }
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
--     for _, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.kind == "source.addMissingImports.ts" then
--           vim.lsp.buf.code_action({
--             apply = true,
--             context = {
--               only = { "source.organizeImports", "source.addMissingImports.ts", "source.fixAll" },
--             },
--           })
--           vim.cmd("write")
--         end
--       end
--     end
--   end,

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" }
)
-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)
-- Show `` in specific files
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.txt", "*.md", "*.json" }, command = "setlocal conceallevel=0" }
)
