{ pkgs, config, inputs, ... }: 
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins/nvim-tree.nix
    ./plugins/treesitter.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;
  };
}
