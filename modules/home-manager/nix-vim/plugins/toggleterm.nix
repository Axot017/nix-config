{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    direction = "float";
    open_mapping = "<C-t>";
  };
}
