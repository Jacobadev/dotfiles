return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig") -- Você pode adicionar configuração adicional aqui
    end,
  },
  "lukas-reineke/lsp-format.nvim",
  config = function()
    require("lsp-format").setup({})
  end,
}
