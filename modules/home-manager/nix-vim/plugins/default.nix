{ pkgs, config, inputs, helpers, ... }: {
  imports = [
    ./autoclose.nix
    ./bufferline.nix
    ./oil.nix
    ./dap.nix
    ./hardtime.nix
    ./neotest.nix
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
    ./tmux-navigator.nix
  ];
}
