{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = { notifier = { enabled = true; }; };
  };
}
