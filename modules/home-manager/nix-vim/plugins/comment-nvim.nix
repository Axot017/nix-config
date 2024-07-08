{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.comment = { enable = true; };
}
