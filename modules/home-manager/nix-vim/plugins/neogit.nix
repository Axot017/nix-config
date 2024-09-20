{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.neogit = { enable = true; };
}
