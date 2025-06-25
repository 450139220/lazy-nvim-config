return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      layout_config = {
        horizontal = { preview_width = 0.6 },
      },
      sorting_strategy = "ascending",
      prompt_prefix = "   ",
    },
  },
  config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      local keymap = vim.keymap.set
      local builtin = require("telescope.builtin")

      keymap("n", "ff", builtin.find_files, { desc = "Find Files" })
      -- keymap("n", "fg", builtin.live_grep, { desc = "Live Grep" })
      -- keymap("n", "fb", builtin.buffers, { desc = "Buffers" })
      -- keymap("n", "fh", builtin.help_tags, { desc = "Help Tags" })
    end
}
