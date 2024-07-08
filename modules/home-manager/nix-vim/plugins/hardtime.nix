{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.hardtime = { enable = true; };
}
