{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.plugins.telescope = {
    enable = true;
  };
}
