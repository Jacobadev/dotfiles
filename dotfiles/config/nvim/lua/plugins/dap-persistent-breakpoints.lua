return {
  "Weissle/persistent-breakpoints.nvim",
  event = "BufReadPost", -- Load the plugin on the BufReadPost event
  opts = {
    load_breakpoints_event = { "BufReadPost" }, -- Specify the event to load breakpoints
  },
  keys = {
    {
      "<Leader>db", -- Key mapping to toggle a breakpoint
      function()
        require("persistent-breakpoints.api").toggle_breakpoint()
      end,
      { silent = true }, -- Options for the key mapping
      desc = "Toggle Breakpoint", -- Description for the key mapping
    },
    {
      "<Leader>dB", -- Key mapping to clear all breakpoints
      function()
        require("persistent-breakpoints.api").clear_all_breakpoints()
      end,
      { silent = true },
      desc = "Clear Breakpoints",
    },
    {
      "<Leader>dC", -- Key mapping to set a conditional breakpoint
      function()
        require("persistent-breakpoints.api").set_conditional_breakpoint()
      end,
      { silent = true },
      desc = "Conditional Breakpoint",
    },
  },
}
