{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings.options = {
      separator_style = "slope";
      indicator = { style = null; };
    };
  };
}
