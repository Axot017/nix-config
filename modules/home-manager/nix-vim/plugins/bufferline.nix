{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.bufferline = { enable = true; };
}
