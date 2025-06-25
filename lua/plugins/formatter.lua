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
        css = {
          require("formatter.filetypes.css").prettier
        },
        -- not for work
        go = {
          require("formatter.filetypes.go").gofumpt
        },
        rust = {
          function ()
            return {
              exe = "rustfmt",
              args = { "--emit=stdout" },
              stdin = true,
            }
          end
        }
      }
    })

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = {
        "*.ts",
        "*.tsx",
        "*.js",
        "*.jsx",
        "*.html",
        "*.css",
        -- not for work
        "*.go",
        "*.rs"
      },
      command = "FormatWrite"
    })
  end
}
