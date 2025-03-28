{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      presets = { bottom_search = true; };
      cmdline = { view = "cmdline"; };
    };
  };
}
