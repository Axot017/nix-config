{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    theme = "horizon";
    extensions = [ "nvim-tree" "nvim-dap-ui" "toggleterm" ];
    sections = {
      lualine_a = {
        name = "tabs";
        mode = 1;
        path = 0;
      };
    };
  };
}
