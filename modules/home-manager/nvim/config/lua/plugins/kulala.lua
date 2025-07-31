local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.kulala_http = {
  filetype = "http",
}

require("kulala").setup({
  global_keymaps = false,
})
