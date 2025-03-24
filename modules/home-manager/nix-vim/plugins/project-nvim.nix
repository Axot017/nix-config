{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.project-nvim = { enable = true; };
}
