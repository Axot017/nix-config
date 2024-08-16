{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.notify = { enable = true; };
}
