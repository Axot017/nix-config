{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap.preset = "super-tab";
      completion.list.selection = "auto_insert";
    };
  };
}
