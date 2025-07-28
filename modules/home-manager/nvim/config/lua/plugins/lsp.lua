local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, bufnr)
end

-- Configure diagnostics display
-- vim.diagnostic.config({
  -- virtual_text = {
    -- prefix = '●',
    -- source = "if_many",
  -- },
  -- float = {
    -- source = "always",
    -- border = "rounded",
  -- },
  -- signs = true,
  -- underline = true,
  -- update_in_insert = false,
  -- severity_sort = true,
-- })

-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
  -- local hl = "DiagnosticSign" .. type
  -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

local servers = {
  elixirls = {},
  gopls = {},
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
  
  nil_ls = {
    settings = {
      ['nil'] = {
        formatting = { command = { "nixpkgs-fmt" } },
      },
    },
  },
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/docker-compose*.yml",
        },
      },
    },
  },
}

for server, config in pairs(servers) do
  local server_config = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, config)
  
  lspconfig[server].setup(server_config)
end
