-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
--
-- parser_config.kulala_http = {
--   filetype = "http",
--   innstall_info = {
--     url = os.getenv("NVIM_KULALA_HTTP_GRAMMAR_PATH"),
--     files = { "src/parser.c" },
--   },
-- }

require("kulala").setup({
  global_keymaps = false,
})
