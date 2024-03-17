{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.bufferline = {
    enable = true;
    separator_style = "slope";
    indicator = { style = "underline"; };
  };
}
