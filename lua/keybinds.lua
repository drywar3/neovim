local set = vim.keymap.set

function nset(key, map, desc)
  set("n", key, map, { desc = desc })
end

function iset(key, map, desc)
  set("i", key, map, { desc = desc })
end

function vset(key, map, desc)
  set("v", key, map, { desc = desc })
end

function xset(key, map, desc)
  set("x", key, map, { desc = desc })
end

-- Basic
nset(";", ":", "Command mode")
vset(";", ":", "Command mode")
iset("jk", "<Esc>", "Escape insert mode")

-- Search
nset("<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")

nset("n", "nzzzv", "Next search result")
nset("N", "Nzzzv", "Previous search result")

-- Scrolling
nset("<C-d>", "<C-d>zz", "Scroll down")
nset("<C-u>", "<C-u>zz", "Scroll up")

-- Keep visual selection centered
vset("J", ":m '>+1<CR>gv=gv", "Move selection down")
vset("K", ":m '<-2<CR>gv=gv", "Move selection up")

-- Indentation
vset("<", "<gv", "Indent left")
vset(">", ">gv", "Indent right")

-- Window navigation
nset("<C-h>", "<C-w>h", "Move to left window")
nset("<C-j>", "<C-w>j", "Move to lower window")
nset("<C-k>", "<C-w>k", "Move to upper window")
nset("<C-l>", "<C-w>l", "Move to right window")

-- Window management
nset("<leader>sv", "<cmd>vsplit<CR>", "Vertical split")
nset("<leader>sh", "<cmd>split<CR>", "Horizontal split")
nset("<leader>sx", "<cmd>close<CR>", "Close window")
nset("<leader>se", "<C-w>=", "Equalize windows")

-- Resize
nset("<C-Up>", "<cmd>resize +2<CR>", "Increase window height")
nset("<C-Down>", "<cmd>resize -2<CR>", "Decrease window height")
nset("<C-Left>", "<cmd>vertical resize -2<CR>", "Decrease window width")
nset("<C-Right>", "<cmd>vertical resize +2<CR>", "Increase window width")

-- Buffers
nset("<S-l>", "<cmd>bnext<CR>", "Next buffer")
nset("<S-h>", "<cmd>bprevious<CR>", "Previous buffer")

nset("<leader>bd", "<cmd>bdelete<CR>", "Delete buffer")
nset("<leader>bo", "<cmd>BufferLineCloseOthers<CR>", "Close other buffers")

vim.keymap.set({ 'n', 'i' }, "<C-s>", function()
  vim.cmd [[lua vim.lsp.buf.format()]]
  vim.cmd [[w]]
end, { desc = "Save Buffer" })
