{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = { files = { }; };
  };
}
