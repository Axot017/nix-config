{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.neorg = { enable = true; };
}
