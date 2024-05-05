{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.tmux-navigator = { enable = true; };
}
