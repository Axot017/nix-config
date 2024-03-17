{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.bufferline = {
    enable = true;
    separatorStyle = "slope";
    indicator = { style = "none"; };
  };
}
