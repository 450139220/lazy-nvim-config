return {
  -- nvim tree icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },

  -- nvim tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<leader>f", "<cmd>NvimTreeToggle<CR>", desc = "toggle file tree" },
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufAdd",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          show_buffer_close_icons = false,
          show_close_icon = false,
          separator_style = "slant",
        },
      })
      vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "next buffer" })
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "prev buffer" })
    end,
  }
}
