{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.bufferline = {
    enable = true;
    separatorStyle = "none";
    indicator = { style = "underline"; };
  };
}
