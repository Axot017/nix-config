{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.neotest = {
    enable = true;
    adapters = { go = { enable = true; }; };
  };
}
