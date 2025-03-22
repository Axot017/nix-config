{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.snacks = {
    enable = true;
    luaConfig.post = ''
      vim.api.nvim_create_autocmd("User", {
        pattern = "OilActionsPost",
        callback = function(event)
            if event.data.actions.type == "move" then
                Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
            end
        end,
      })
    '';
    settings = {
      animate = { enabled = true; };
      bigfile = { enabled = true; };
      bufdelete = { enabled = true; };
      image = { enabled = true; };
      indent = { enabled = true; };
      input = { enabled = true; };
      notifier = { enabled = true; };
      rename = { enabled = true; };
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
