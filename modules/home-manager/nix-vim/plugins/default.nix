{ pkgs, config, inputs, ... }: 
{
  imports = [
    ./nvim-tree.nix
    ./treesitter.nix
    ./telescope.nix
    ./copilot.nix
  ];
}
