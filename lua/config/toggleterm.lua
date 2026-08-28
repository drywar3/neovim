local toggleterm = require("toggleterm")

toggleterm.setup({
  size = 15,

  open_mapping = [[<C-\>]],

  hide_numbers = true,

  shade_filetypes = {},

  shade_terminals = true,

  shading_factor = 2,

  start_in_insert = true,

  insert_mappings = true,

  terminal_mappings = true,

  persist_size = true,

  persist_mode = true,

  direction = "float",

  close_on_exit = true,

  shell = vim.o.shell,

  float_opts = {
    border = "rounded",

    winblend = 0,

    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

local Terminal = require("toggleterm.terminal").Terminal

local float_term = Terminal:new({
  direction = "float",
})

local horizontal_term = Terminal:new({
  direction = "horizontal",
  size = 15,
})

vim.keymap.set("n", "<leader>tf", function()
  float_term:toggle()
end, {
  desc = "Floating terminal",
})

vim.keymap.set("n", "<leader>th", function()
  horizontal_term:toggle()
end, {
  desc = "Horizontal terminal",
})
