{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings.options = {
      theme = "horizon";
      globalstatus = true;
    };
  };
}
