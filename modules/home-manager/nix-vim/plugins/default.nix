{ pkgs, config, inputs, helpers, ... }: {
  imports = [
    ./autoclose.nix
    ./toggleterm.nix
    ./bufferline.nix
    ./nvim-tree.nix
    ./treesitter.nix
    ./telescope.nix
    ./copilot.nix
    ./lsp.nix
    ./cmp.nix
    ./comment-nvim.nix
    ./project-nvim.nix
    ./luasnip.nix
    ./lualine.nix
    ./none-ls.nix
  ];
}
