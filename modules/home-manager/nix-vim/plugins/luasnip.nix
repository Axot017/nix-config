{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.plugins.luasnip = {
    enable = true;
  };
}
