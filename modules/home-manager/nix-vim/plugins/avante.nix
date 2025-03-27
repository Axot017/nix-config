{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.avante = {
    enable = true;
    settings = {
      provider = "claude";
      claude = {
        api_key_name = "cmd:cat /home/axot/.config/.secret/anthropic";
      };
      file_selector = { provider = "snacks"; };
    };
  };
}
