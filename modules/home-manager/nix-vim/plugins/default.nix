{ pkgs, config, inputs, helpers, ... }: {
  imports = [
    ./autoclose.nix
    ./blink-cmp.nix
    ./bufdelete.nix
    ./bufferline.nix
    ./codecompanion.nix
    ./comment-nvim.nix
    # ./copilot.nix
    ./dap.nix
    ./dressing.nix
    ./go.nix
    ./lsp.nix
    ./lualine.nix
    ./luasnip.nix
    ./mini.nix
    ./minuet.nix
    ./multiterm.nix
    ./neogit.nix
    ./neorg.nix
    ./neotest.nix
    ./noice.nix
    ./none-ls.nix
    ./oil.nix
    ./project-nvim.nix
    ./snacks.nix
    # ./telescope.nix
    ./tmux-navigator.nix
    ./treesitter.nix
    ./web-devicons.nix
  ];
}
