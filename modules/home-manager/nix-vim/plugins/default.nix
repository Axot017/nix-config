{ pkgs, config, inputs, helpers, ... }: 
{
  imports = [
    ./nvim-tree.nix
    ./treesitter.nix
    ./telescope.nix
    ./copilot.nix
    ./lsp.nix
    ./comment-nvim.nix
  ];
}
