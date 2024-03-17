{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    theme = "horizon";
    globalstatus = true;
  };
}
