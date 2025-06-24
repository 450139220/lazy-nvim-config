return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- for icons
    "nvim-treesitter/nvim-treesitter" -- optional but recommended
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
      },
      lightbulb = {
        enable = false,
        -- enable_in_insert = false,
        -- sign = true,
        -- sign_priority = 40,
        -- virtual_text = true
      },
      symbol_in_winbar = {
        enable = false
      }
    })

    -- hover border styles
    vim.api.nvim_set_hl(0, "HoverNormal", { bg = "#1e1e2e", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "HoverBorder", { fg = "#89dceb" })

    -- keymaps
    local keymap = vim.keymap.set
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Lspsaga Hover" })
    keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })
    -- keymap("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "References/Definitions" })
    -- keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
    keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename" })
    keymap("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })
    -- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Buffer Diagnostics" })
    -- keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
    -- keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Symbols Outline" })
  end
}
