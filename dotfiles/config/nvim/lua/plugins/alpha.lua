return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- Add some extra padding at the top.
      dashboard.opts.layout[1].val = 7

      local header = [[
                ███╗   ██╗ ██████╗ ████████╗     █████╗     ██████╗ ██╗   ██╗ ██████╗
                ████╗  ██║██╔═══██╗╚══██╔══╝    ██╔══██╗    ██╔══██╗██║   ██║██╔════╝
                ██╔██╗ ██║██║   ██║   ██║       ███████║    ██████╔╝██║   ██║██║  ███╗
                ██║╚██╗██║██║   ██║   ██║       ██╔══██║    ██╔══██╗██║   ██║██║   ██║
                ██║ ╚████║╚██████╔╝   ██║       ██║  ██║    ██████╔╝╚██████╔╝╚██████╔╝▄█╗
                ╚═╝  ╚═══╝ ╚═════╝    ╚═╝       ╚═╝  ╚═╝    ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝

██████╗ ██╗   ██╗████████╗     █████╗     ███████╗███████╗ █████╗ ████████╗██╗   ██╗██████╗ ███████╗
██╔══██╗██║   ██║╚══██╔══╝    ██╔══██╗    ██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔════╝
██████╔╝██║   ██║   ██║       ███████║    █████╗  █████╗  ███████║   ██║   ██║   ██║██████╔╝█████╗
██╔══██╗██║   ██║   ██║       ██╔══██║    ██╔══╝  ██╔══╝  ██╔══██║   ██║   ██║   ██║██╔══██╗██╔══╝
██████╔╝╚██████╔╝   ██║       ██║  ██║    ██║     ███████╗██║  ██║   ██║   ╚██████╔╝██║  ██║███████╗██╗
╚═════╝  ╚═════╝    ╚═╝       ╚═╝  ╚═╝    ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝
            ]]
      dashboard.section.header.val = vim.split(header, "\n")
      dashboard.section.header.opts.hl = "AlphaHeader"

      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", LazyVim.pick()),
        dashboard.button("n", " " .. " New file", [[<cmd> ene <BAR> startinsert <cr>]]),
        dashboard.button("r", " " .. " Recent files", LazyVim.pick("oldfiles")),
        dashboard.button("g", " " .. " Find text", LazyVim.pick("live_grep")),
        dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
      }
      dashboard.section.buttons.opts.hl = "AlphaButtons"

      return dashboard.opts
    end,
    config = function(_, opts)
      require("alpha").setup(opts)

      -- Hide some parts of the UI while the dashboard is open.
      local alpha_group = vim.api.nvim_create_augroup("mariasolos/alpha", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = alpha_group,
        desc = "Minimal UI in Alpha dashboard",
        pattern = "AlphaReady",
        once = true,
        callback = function(args)
          vim.o.laststatus = 0
          vim.o.cmdheight = 0

          vim.api.nvim_create_autocmd("BufUnload", {
            group = alpha_group,
            buffer = args.buf,
            once = true,
            callback = function()
              vim.o.laststatus = 3
              vim.o.cmdheight = 1
            end,
          })
        end,
      })
    end,
  },
}
