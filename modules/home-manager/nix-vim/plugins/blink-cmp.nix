{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "none";
        "<Tab>" = [ "select_next" "fallback" ];
        "<S-Tab>" = [ "select_prev" "fallback" ];
        "<CR>" = [ "accept" "fallback" ];
      };
      completion.list.selection = {
        auto_insert = true;
        preselect = false;
      };
    };
  };
}
