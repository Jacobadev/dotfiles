-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
local venv_path = os.getenv('VIRTUAL_ENV')
local py_path = nil
-- decide which python executable to use for mypy
if venv_path ~= nil then
  py_path = venv_path .. "/bin/python3"
else
  py_path = vim.g.python3_host_prog
end



require("lvim.lsp.manager").setup("clangd")
require("lvim.lsp.manager").setup("mdformat")
require("lvim.lsp.manager").setup("biome")
require("lvim.lsp.manager").setup("tsserver")
require("lvim.lsp.manager").setup("tailwindcss")
require("lvim.lsp.manager").setup("emmet_ls")
require("lvim.lsp.manager").setup("cssls")
require("lvim.lsp.manager").setup("marksman"
)
require 'lspconfig'.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {

        flake8 = { enabled = true, maxLineLenght = 120 },
        pycodestyle = { enabled = false },
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = false, executable = "pylint" },
        ruff = { enabled = false },
        pyflakes = { enabled = false },
        -- type checker
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        isort = { enabled = true }, }
    }
  }, flags = {
  debounce_text_changes = 200,
},
  capabilities = capabilities,
}


require 'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}
vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    pattern = "*.py",
    group = "AutoFormat",
    callback = function()
      vim.cmd("silent !black --quiet %")
      vim.cmd("edit")
    end,
  }
)

lvim.format_on_save.enabled = true

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Cycle through buffers with Ctrl+Tab and Ctrl+Shift+Tab
vim.api.nvim_set_keymap('n', '<Tab>', [[:bnext<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', [[:bprev<CR>]], { noremap = true, silent = true })

vim.wo.relativenumber = true
