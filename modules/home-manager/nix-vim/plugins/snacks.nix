{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      animate = { enabled = true; };
      bigfile = { enabled = true; };
      bufdelete = { enabled = true; };
      dashboard = { enabled = true; };
      image = { enabled = true; };
      indent = { enabled = true; };
      input = { enabled = true; };
      notifier = { enabled = true; };
      scope = { enabled = true; };
      scroll = { enabled = true; };
      words = { enabled = true; };
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
        layout = { preset = "ivy"; };
      };
    };
  };
}
