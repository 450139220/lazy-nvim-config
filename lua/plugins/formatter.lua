return {
  "mhartington/formatter.nvim",
  config = function()
    local formatter = require("formatter")

    formatter.setup({
      filetype = {
        javascript = {
          require("formatter.filetypes.javascript").prettier
        },
        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettier
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier
        },
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettier
        },
        html = {
          require("formatter.filetypes.html").prettier
        },
      }
    })

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.html" },
      command = "FormatWrite"
    })
  end
}
