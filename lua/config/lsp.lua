local capabilities = require('blink.cmp').get_lsp_capabilities()
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "ts_ls",
    "html",
    "cssls",
    "jsonls",
    "bashls",
    "clangd",
  },
})

vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = {
    ".git",
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },

      diagnostics = {
        globals = {
          "vim",
        },
      },

      workspace = {
        checkThirdParty = false,
      },

      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable({
  "lua_ls",
  "pyright",
  "ts_ls",
  "html",
  "cssls",
  "jsonls",
  "bashls",
  "clangd",
  "marksman",
})
