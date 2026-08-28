require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ['<Tab>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<S-Tab>'] = { 'select_next', 'fallback_to_mappings' },
  },

  completion = {
    menu = {
      border = "rounded",
    },

    documentation = {
      auto_show = true,
    },

    ghost_text = {
      enabled = true,
    },
  },

  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
  },

  signature = {
    enabled = true,
  },

  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})
