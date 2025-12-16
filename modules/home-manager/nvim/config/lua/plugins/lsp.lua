local lspconfig = require('lspconfig')

local servers = {
  elixirls = {
    cmd = { os.getenv("NVIM_ELIXIR_LS_PATH") or "elixir-ls" },
  },
  gopls = {},
  gleam = {},
  ocamllsp = {},
  tofu_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  },

  nil_ls = {},
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
          "/docker-compose*.yml",
        },
      },
    },
  },
}

for server, config in pairs(servers) do
  vim.lsp.enable(server)
  vim.lsp.config(server, config)
end
