{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.avante = {
    enable = true;
    settings = {
      provider = "claude";
      auto_suggestions_provider = "ollama";
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
        auto_suggestions = false;
      };
      vendors = {
        ollama = {
          __inherited_from = "openai";
          api_key_name = "";
          endpoint = "http://127.0.0.1:11434/v1";
          model = "qwen2.5-coder:7b";
          disable_tools = true;
        };
      };

      file_selector = { provider = "snacks"; };
      mappings = { suggestions = { accept = "<C-y>"; }; };
    };
  };
}
