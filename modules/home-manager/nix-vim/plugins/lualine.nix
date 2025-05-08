{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings.options = {
      theme = "horizon";
      globalstatus = true;
    };
    settings.sections = {
      lualine_x.__raw = ''
        {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          }
        }
      '';
    };
  };
}
