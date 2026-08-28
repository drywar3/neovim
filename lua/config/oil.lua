require 'oil'.setup {
  default_file_explorer = true,
  columns = {
    'icon',
  },
  delete_to_trash = true,
  skip_confirm_from_simple_edits = true,

  view_options = {
    show_hidden = false,
    is_always_hidden = function(name, bufnr)
      return name == '..'
    end,
  },

  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-x>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",

    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",

    ["g."] = "actions.toggle_hidden",
    ["gx"] = "actions.open_external",

    ["q"] = "actions.close",
  },

  float = {
    padding = 2,
    max_width = 100,
    max_height = 30,
    border = "rounded",
  }
}

nset("-", "<cmd>Oil --float<cr>", "Open Oil")
