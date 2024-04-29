{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    direction = "float";
    settings.open_mapping = "<C-t>";
  };
}
