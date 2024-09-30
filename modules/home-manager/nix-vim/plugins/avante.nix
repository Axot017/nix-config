{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = { avante.enable = true; };
}
