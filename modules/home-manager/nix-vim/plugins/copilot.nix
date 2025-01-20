{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = {
    copilot-lua = {
      enable = true;
      settings.suggestion = {
        enabled = true;
        auto_trigger = true;
        keymap = { accept = "<C-y>"; };
      };
    };
    copilot-chat = { enable = true; };
  };
}
