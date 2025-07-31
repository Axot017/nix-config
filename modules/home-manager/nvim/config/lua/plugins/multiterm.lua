require('multiterm').setup({
  mappings = {
    n = {
      ["<esc>"] = function()
        require('multiterm').close_active()
      end,
    },
  }
})
