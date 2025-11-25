require('snacks').setup({
  bigfile = { enabled = true },
  bufdelete = { enabled = true },
  image = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  rename = { enabled = true },
  scope = { enabled = true },
  words = { enabled = true },
  terminal = { enabled = true },
  picker = {
    enabled = true,
    matcher = {
      fuzzy = true,
      smartcase = true,
      file_pos = true,
      cwd_bonus = true,
      frecency = true,
      history_bonus = true,
    },
    layout = { preset = "ivy" },
  },
})
