{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.llm = {
    enable = true;
    settings = {
      backend = "ollama";
      url = "http://localhost:11434";
      model = "qwen2.5-coder:7b";
      fim = { enable = true; };
      debounce_ms = 150;
      accept_keymap = "<C-y>";
    };
  };
}
