local arrows = require("icons").arrows

local icons = {
  Stopped = { "", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint = "",
  BreakpointRejected = { "", "DiagnosticError" },
  BreakpointCondition = "",
  LogPoint = arrows.right,
}
for name, sign in pairs(icons) do
  sign = type(sign) == "table" and sign or { sign }
  vim.fn.sign_define("Dap" .. name, {
        -- stylua: ignore
        text = sign[1] --[[@as string]] .. ' ',
    texthl = sign[2] or "DiagnosticInfo",
    linehl = sign[3],
    numhl = sign[3],
  })
end
return {

  "mfussenegger/nvim-dap",

  dependencies = {

    { "nvim-neotest/nvim-nio" },

    {
      "rcarriga/nvim-dap-ui",

      keys = {
        {
          "<leader>du",
          function()
            require("dapui").toggle({})
          end,
          desc = "Dap UI",
        },
        {
          "<leader>de",
          function()
            -- Calling this twice to open and jump into the window.
            require("dapui").eval()
            require("dapui").eval()
          end,
          desc = "Evaluate expression",
        },
      },
      opts = {
        icons = {
          collapsed = arrows.right,
          current_frame = arrows.right,
          expanded = arrows.down,
        },
        floating = { border = "rounded" },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.50 },
              { id = "watches", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "variables", size = 0.10 },
              { id = "stacks", size = 0.10 },
            },
            position = "left",
            size = 50,
          },
        },
      },
    },
    --
    --   -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = { virt_text_pos = "eol" },
    },

    -- which key integration
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        defaults = {
          ["<leader>d"] = { name = "+debug" },
        },
      },
    },
    --
    --   -- mason.nvim integration
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things insta
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<F5>", function() require("dap").continue() end, desc = "Continue" },
    { "<F8>", function() require("dap").step_over() end, desc = "Step Over" },
    { "<F9>", function() require("dap").step_into() end, desc = "Step Into" },
    { "<F10>", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dR", function() require("dap").clear_breakpoints() end, desc = "Remove all breakpoints" },
 {
        "gb",
        function()
          require("dap").list_breakpoints()
          vim.cmd.cwindow()
        end,
        desc = "list breakpoints",
      },
    { "<leader>dS", function() require("dap").list_breakpoints() end, desc = "list_breakpoints" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>dj", function() require("dap").down() end, desc = "Move down in stack" },
    { "<leader>dk", function() require("dap").up() end, desc = "Move up in stack" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
    local Config = require("lazyvim.config")
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(Config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end
  end,
}
