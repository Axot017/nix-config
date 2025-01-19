{ pkgs, config, inputs, ... }: {
  programs.nixvim = {
    colorschemes.tokyonight = {
      enable = true;
      settings = { style = "storm"; };
    };
  };
}
