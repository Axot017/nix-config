local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
--    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = augroup,
  pattern = "OilActionsPost",
  callback = function(event)
    if event.data.actions.type == "move" then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
    end
  end,
})
