{ pkgs, config, inputs, ... }: {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins/default.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight = {
      enable = true;
      settings = { style = "storm"; };
    };
  };
}
