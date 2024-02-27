{ pkgs, config, inputs, ... }: 
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;
    plugins.nvim-tree.enable = true;
  };
}
