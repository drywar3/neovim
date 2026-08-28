local npairs = require("nvim-autopairs")

npairs.setup({
  check_ts = true,

  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    typescript = { "template_string" },
  },

  disable_filetype = {
    "TelescopePrompt",
    "vim",
  },

  enable_check_bracket_line = false,

  enable_moveright = true,
  enable_afterquote = true,
  map_cr = true,
  map_bs = true,
  map_c_h = false,
  map_c_w = false,
})
