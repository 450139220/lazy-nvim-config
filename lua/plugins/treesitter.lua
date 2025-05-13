return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "html",
        "css",
        "javascript",
        "typescript",
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
