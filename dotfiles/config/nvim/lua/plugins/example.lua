-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    {
        "ThePrimeagen/refactoring.nvim",
        keys = {
            {
                "<leader>r",
                function()
                    require("refactoring").setup({show_success_message=true})
                end,
                mode = "v",
                noremap = true,
                silent = true,
                expr = false,
            },
        },
        opts = {},
    },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = true,
    opts = { style = "moon",

    },

    -- change trouble config
    {
      "folke/trouble.nvim",
      -- opts will be merged with the parent spec
      opts = { use_diagnostic_signs = true },
    },

    -- disable trouble

    -- add symbols-outline
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
      config = true,
    },

    -- override nvim-cmp and add cmp-emoji
    {
      "hrsh7th/nvim-cmp",
      dependencies = { "hrsh7th/cmp-emoji" },
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        table.insert(opts.sources, { name = "emoji" })
      end,
    },

    -- change some telescope options and a keymap to browse plugin files
    {
      "nvim-telescope/telescope.nvim",
      keys = {
        -- add a keymap to browse plugin files
        -- stylua: ignore
        {
          "<leader>fP",
          function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
          desc = "Find Plugin File",
        },
      },
      -- change some options
      opts = {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
        },
      },
    },

    -- add telescope-fzf-native
    {
      "telescope.nvim",
      dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },


    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        
        ensure_installed = {
          "bash",
          "html",
          "javascript",
          "json",
          "markdown",
          "markdown_inline",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "yaml",

        },
        auto_install = true,
      },
    },

    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      opts = function(_, opts)
        table.insert(opts.sections.lualine_x, "😄")
      end,
    },


    -- add any tools you want to have installed below
   
    {
      "catppuccin/nvim",
      lazy = true,
      name = "catppuccin",
      opts = {
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          neotree = true,
          noice = true,
          notify = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      },
    },
    -- Use <tab> for completion and snippets (supertab)
    -- first: disable default <tab> and <s-tab> behavior in LuaSnip
    {
      "L3MON4D3/LuaSnip",
      keys = function()
        return {}
      end,
    },
   -- then: setup supertab in cmp
    --
    {
      "Exafunction/codeium.nvim",
      cmd = "Codeium",
      build = ":Codeium Auth",
      opts = {
  
                    vim.keymap.set("i", "<C-g>", function()
                        return vim.fn["codeium#Accept"]()
                    end, { expr = true, silent = true }),
                    vim.keymap.set("i", "<c-;>", function()
                        return vim.fn["codeium#CycleCompletions"](1)
                    end, { expr = true, silent = true }),
                    vim.keymap.set("i", "<c-,>", function()
                        return vim.fn["codeium#CycleCompletions"](-1)
                    end, { expr = true, silent = true }),
                    vim.keymap.set("i", "<c-x>", function()
                        return vim.fn["codeium#Clear"]()
                    end, { expr = true, silent = true }),
          },
    },
{
  "nvim-cmp",
  dependencies = {
    "Exafunction/codeium.nvim",
    "hrsh7th/cmp-emoji", -- Add dependencies from the second configuration
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, 1, {
      name = "codeium",
      group_index = 1,
      priority = 1000,
    })

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0
          and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")
    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
  } }
