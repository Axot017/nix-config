{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.noice = { enable = true; };
}
