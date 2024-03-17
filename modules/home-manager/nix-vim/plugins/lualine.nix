{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    theme = "horizon";
    extensions = [ "nvim-tree" "nvim-dap-ui" "toggleterm" ];
  };
}
