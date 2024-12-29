{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.blink-cmp = { enable = true; };
}
