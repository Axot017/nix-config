{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.avante = {
    enable = true;
    settings = {
      provider = "gemini";
      claude = {
        api_key_name = "cmd:cat /home/axot/.config/.secret/anthropic";
      };
      gemini = {
        api_key_name = "cmd:cat /home/axot/.config/.secret/gemini";
        model = "gemini-2.0-flash-latest";
      };
      file_selector = { provider = "snacks"; };
    };
  };
}
