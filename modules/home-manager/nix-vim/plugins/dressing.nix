{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.dressing = { enable = true; };
}
