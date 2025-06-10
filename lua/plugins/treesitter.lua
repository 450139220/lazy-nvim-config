return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      require("nvim-ts-autotag").setup({
        opts = {},
      }),
      ensure_installed = {
        "c",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "markdown",
        "markdown_inline",
        "go",
        "lua",
      },
      hightlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end
}
