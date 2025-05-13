return {
  "barrett-ruth/live-server.nvim",
  build = "npm add -g live-server",
  cmd = { "LiveServerToggle" },
  config = true,
  opts = {},
  keys = {
    { "<F2>", "<cmd>LiveServerToggle<CR>", desc = "toggle live server" },
  }
}
