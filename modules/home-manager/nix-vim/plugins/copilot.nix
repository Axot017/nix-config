{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.plugins.copilot-lua = {
    enable = true;
    suggestion = {
      enabled = true;
      autoTrigger = true;
      keymap = {
        accept = "<C-y>";
      };
    };
  };
}
