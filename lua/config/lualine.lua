local lualine = require 'lualine'

lualine.setup {
	options = {
		theme = "auto",
		globalstatus = true,

		component_separators = {
			left = "",
			right = "",
		},

		section_separators = {
			left = "",
			right = "",
		},

		disabled_filetypes = {
			statusline = {
				"dashboard",
				"alpha",
				"starter",
			},
		},
	},

	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 1)
				end,
			},
		},

		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
		},

		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},

		lualine_x = {
			"encoding",
			"fileformat",
			"filetype",
		},

		lualine_y = {
			"progress",
		},

		lualine_z = {
			"location",
		},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = {
			"location",
		},
		lualine_y = {},
		lualine_z = {},
	},
}

