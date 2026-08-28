vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",

  group = vim.api.nvim_create_augroup("markdown-keymaps", {
    clear = true,
  }),

  callback = function(event)
    vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", {
      buffer = event.buf,
      desc = "Markdown preview",
    })
  end,
})
