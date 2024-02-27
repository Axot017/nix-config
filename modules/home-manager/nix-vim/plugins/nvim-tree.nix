{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.plugins.nvim-tree = {
    enable = true;
  };
}
