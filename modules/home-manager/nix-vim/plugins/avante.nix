{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.avante = {
    enable = true;
    settings = {
      provider = "ollama";
      # auto_suggestions_provider = "ollama";
      cursor_applying_provider = "gemini";
      claude = {
        api_key_name.__raw =
          ''"cmd:cat " .. os.getenv("HOME") .. "/.config/.secret/anthropic"'';
        model = "claude-3-5-sonnet-latest";
      };
      gemini = {
        api_key_name.__raw =
          ''"cmd:cat " .. os.getenv("HOME") .. "/.config/.secret/gemini"'';
        model = "gemini-2.0-flash";
      };
      ollama = { model = "qwen2.5-coder:7b"; };
      behaviour = {
        enable_cursor_planning_mode = false;
        auto_suggestions = true;
      };
      file_selector = { provider = "snacks"; };
      mappings = { suggestions = { accept = "<C-y>"; }; };
    };
  };
}
