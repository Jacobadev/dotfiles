return {
  "mfussenegger/nvim-dap",
  keys = {
    ["<F1>"] = { "<cmd>lua require('dapui').toggle()<CR>", "DAP UI" },
    ["<F2>"] = { "<cmd>lua require('dap').step_over()<CR>", "DAP Step Over" },
    ["<F3>"] = { "<cmd>lua require('dap').step_into()<CR>", "DAP Step Into" },
    ["<F4>"] = { "<cmd>lua require('dap').step_out()<CR>", "DAP Step Out" },
    ["<F5>"] = { "<cmd>lua require('dap').continue()<CR>", "DAP Continue" },
    ["<F6>"] = { "<cmd>lua require('dap').down()<CR>", "DAP Down Stack" },
    ["<F7>"] = { "<cmd>lua require('dap').up()<CR>", "DAP Up Stack" },
    ["<F8>"] = { "<cmd>lua require('dap').run_to_cursor()<CR>", "DAP Run To Cursor" },
    ["<F12>"] = { "<cmd>lua require('dap').terminate()<CR>", "DAP Terminate" },
  },
  keys = {
    { "<leader>d", "", desc = "+debug", mode = { "n", "v" } },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Breakpoint Condition",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<leader>da",
      function()
        require("dap").continue({ before = get_args })
      end,
      desc = "Run with Args",
    },
    {
      "<leader>dC",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run to Cursor",
    },
    {
      "<leader>dg",
      function()
        require("dap").goto_()
      end,
      desc = "Go to Line (No Execute)",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>dj",
      function()
        require("dap").down()
      end,
      desc = "Down",
    },

    {
      "<leader>dk",
      function()
        require("dap").up()
      end,
      desc = "Up",
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>do",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dp",
      function()
        require("dap").pause()
      end,
      desc = "Pause",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle REPL",
    },
    {
      "<leader>ds",
      function()
        require("dap").session()
      end,
      desc = "Session",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate",
    },
    {
      "<leader>dw",
      function()
        require("dap.ui.widgets").hover()
      end,
      desc = "Widgets",
    },
  },
}
