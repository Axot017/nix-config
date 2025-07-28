local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.hclfmt,
    null_ls.builtins.formatting.mix,
    null_ls.builtins.formatting.nixfmt,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.code_actions.gitsigns,
  },
})
