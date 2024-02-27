{ pkgs, config, inputs, ... }: 
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;
    plugins.nvim-tree.enable = true;
  };
}
