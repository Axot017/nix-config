{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.plugins.autoclose = {
    enable = true;
  };
}
