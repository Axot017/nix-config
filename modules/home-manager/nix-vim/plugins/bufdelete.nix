{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.bufdelete = { enable = true; };
}
