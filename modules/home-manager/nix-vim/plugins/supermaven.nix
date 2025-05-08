{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = {
    supermaven = {
      enable = true;
      settings = { keymaps = { accept_suggestion = "<C-y>"; }; };
    };
  };
}
