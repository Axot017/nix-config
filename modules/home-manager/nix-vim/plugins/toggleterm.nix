{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    direction = "float";
    openMapping = "<C-t>";
  };
}
