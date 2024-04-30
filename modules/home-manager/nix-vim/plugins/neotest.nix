{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.neotest = {
    enable = true;
    adapters = { rust.enable = true; };
  };
}
