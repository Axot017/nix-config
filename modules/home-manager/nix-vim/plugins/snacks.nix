{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      notifier = { enabled = true; };
      picker = {
        enabled = true;
        matcher = {
          fuzzy = true;
          smartcase = true;
          file_pos = true;
          cwd_bonus = true;
          frecency = true;
          history_bonus = true;
        };
        preset = "ivy";
        layout = { position = "bottom"; };
      };
      input = { enabled = true; };
      words = { enabled = true; };
    };
  };
}
