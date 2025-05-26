{ pkgs, config, inputs, helpers, ... }: {
  imports = [
    ./autoclose.nix
    ./blink-cmp.nix
    ./bufdelete.nix
    ./bufferline.nix
    ./comment-nvim.nix
    # ./copilot.nix
    ./dap.nix
    ./dressing.nix
    ./go.nix
    ./lsp.nix
    ./lualine.nix
    ./luasnip.nix
    ./mini.nix
    ./multiterm.nix
    ./neogit.nix
    ./neorg.nix
    ./neotest.nix
    ./noice.nix
    ./fateweaver.nix
    ./none-ls.nix
    ./oil.nix
    ./snacks.nix
    ./treesitter.nix
    ./web-devicons.nix
  ];
}
