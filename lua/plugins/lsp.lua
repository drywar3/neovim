return {
  "neovim/nvim-lspconfig",

  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
    },

    "williamboman/mason-lspconfig.nvim",
  },

  event = {
    "BufReadPre",
    "BufNewFile",
  },

  config = function()
    -- require("config.lsp")
  end,
}
