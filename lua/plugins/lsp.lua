return {
  -- lsp
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = false,
      ensure_installed = {
        "lua_ls"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      vim.diagnostic.config({
        virtuaL_text = {
          spacing = 2,
          prefix = "●",
          max_width = 50,
          severity = nil,
        },
        float = {
          border = "single",
          source = "always",
          header = "Diagnostic",
          prefix = "",
        },
        signs = true,
      })

      vim.api.nvim_set_keymap(
        "n", "<leader>e",
        "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>",
        { noremap = true, silent = true }
      )

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig["cssls"].setup({})
      lspconfig["css_variables"].setup({})
      lspconfig["cssmodules_ls"].setup({})
      lspconfig["html"].setup({
        capabilities = capabilities
      })
      lspconfig["jsonls"].setup({})
      lspconfig["lua_ls"].setup({})
      lspconfig["tailwindcss"].setup({})
      lspconfig["ts_ls"].setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      })
      lspconfig["volar"].setup({})

      lspconfig["gopls"].setup({})
    end
  },

  -- cmp
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "brenoprata10/nvim-highlight-colors",
    },
    config = function()
      local cmp = require("cmp")

      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load({
        paths = "../snippets"
      })

      require("nvim-highlight-colors").setup({})

      local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
      end
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
        },
        formatting = {
          format = require("nvim-highlight-colors").format
        },
        mapping = cmp.mapping.preset.insert({
          ['<c-b>'] = cmp.mapping.scroll_docs(-4),
          ['<c-f>'] = cmp.mapping.scroll_docs(4),
          ['<c-e>'] = cmp.mapping.abort(),
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
          ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),

          ["<s-tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        }),

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- for luasnip users.
          { name = 'path' },
        }, {
          { name = 'buffer' },
        }),
sorting = {
  priority_weight = 2,
  comparators = {
    function(entry1, entry2)
      -- only boost "log" snippet to top
      local is_log_snippet = function(entry)
        return entry.completion_item.label == "log"
          and entry.source.name == "luasnip"
      end

      if is_log_snippet(entry1) and not is_log_snippet(entry2) then
        return true
      elseif not is_log_snippet(entry1) and is_log_snippet(entry2) then
        return false
      end

      return nil
    end,

    -- default comparators
    require("cmp.config.compare").offset,
    require("cmp.config.compare").exact,
    require("cmp.config.compare").score,
    require("cmp.config.compare").recently_used,
    require("cmp.config.compare").kind,
    require("cmp.config.compare").sort_text,
    require("cmp.config.compare").length,
    require("cmp.config.compare").order,
  }
}

      })
    end
  }
}
