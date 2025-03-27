{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.avante = {
    enable = true;
    settings = {
      provider = "claude";
      cursor_applying_provider = "gemini";
      claude = {
        api_key_name = "cmd:cat /home/axot/.config/.secret/anthropic";
        model = "claude-3-7-sonnet-latest";
      };
      gemini = {
        api_key_name = "cmd:cat /home/axot/.config/.secret/gemini";
        model = "gemini-2.0-flash";
      };
      behaviour = {
        enable_cursor_planning_mode = false;
        auto_suggestions = false;
      };
      file_selector = { provider = "snacks"; };
    };
  };
}
