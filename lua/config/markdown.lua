require("render-markdown").setup({
  enabled = true,

  render_modes = {
    "n",
    "c",
  },

  heading = {
    enabled = true,
    sign = false,

    icons = {
      "󰉫 ",
      "󰉬 ",
      "󰉭 ",
      "󰉮 ",
      "󰉯 ",
      "󰉰 ",
    },

    position = "overlay",
  },

  code = {
    enabled = true,

    sign = false,

    style = "full",

    position = "left",

    width = "full",

    left_pad = 1,
    right_pad = 1,

    border = "thin",
  },

  bullet = {
    enabled = true,

    icons = {
      "●",
      "○",
      "◆",
      "◇",
    },

    left_pad = 1,
  },

  checkbox = {
    enabled = true,

    unchecked = {
      icon = "󰄱 ",
      highlight = "RenderMarkdownUnchecked",
    },

    checked = {
      icon = "󰱒 ",
      highlight = "RenderMarkdownChecked",
    },

    custom = {
      todo = {
        raw = "[~]",
        rendered = "󰥔 ",
        highlight = "RenderMarkdownTodo",
      },
    },
  },

  quote = {
    enabled = true,
    icon = "▌",
  },

  pipe_table = {
    enabled = true,

    preset = "round",

    style = "full",

    cell = "padded",
  },

  link = {
    enabled = true,

    image = "󰥶 ",
    email = "󰀓 ",
    hyperlink = "󰌷 ",
  },
})
