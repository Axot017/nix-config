{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.neotest = {
    enable = false;
    adapters = { go = { enable = true; }; };
  };
}
