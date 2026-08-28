require("lsp_signature").setup({
  bind = true,

  doc_lines = 10,

  floating_window = true,
  floating_window_above_cur_line = true,

  fix_pos = true,

  hint_enable = true,
  hint_prefix = "󰏪 ",

  hi_parameter = "LspSignatureActiveParameter",

  handler_opts = {
    border = "rounded",
  },

  max_height = 12,
  max_width = 120,

  transparency = 0,

  toggle_key = "<C-s>",

  extra_trigger_chars = {
    ",",
    "(",
  },
})
