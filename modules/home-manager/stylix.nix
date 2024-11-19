{ config, pkgs, ... }: {
  stylix = {
    targets = {
      nixvim = { enable = false; };
      hyprland = { enable = false; };
    };
  };
}
