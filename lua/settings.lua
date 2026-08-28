-- lua/settings.lua

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Signs / diagnostics
opt.signcolumn = "yes"

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- UI
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.showcmd = false
opt.cmdheight = 1
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Text
opt.wrap = false
opt.linebreak = true
opt.breakindent = true

-- Files
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true

-- Completion
opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
}

-- Faster updates
opt.updatetime = 250
opt.timeoutlen = 300

-- Clipboard
-- opt.clipboard = "unnamedplus"

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = false

-- Mouse
opt.mouse = "a"

-- Misc
opt.hidden = true
opt.confirm = true
opt.backspace = {
  "indent",
  "eol",
  "start",
}

-- Background Opacity
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

require "keybinds"
