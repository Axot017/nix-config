{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = { web-devicons = { enable = true; }; };
}
