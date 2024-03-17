{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.plugins.comment-nvim = {
    enable = true;
  };
}
