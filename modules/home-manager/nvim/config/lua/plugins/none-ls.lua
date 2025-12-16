local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.opentofu_fmt,
    null_ls.builtins.formatting.mix,
    null_ls.builtins.formatting.nixfmt,
    null_ls.builtins.formatting.ocamlformat,
    null_ls.builtins.formatting.yamlfmt,
  },
})
