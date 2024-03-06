{ config, pkgs, ... }:
let
  sweet = import ./packages/sweet-theme.nix { inherit pkgs; };
in
{
  gtk = {
    enable = true;
    theme = {
      name = "Sweet";
      package = sweet;
    };
  };
  home.file = {
    ".theme/${config.gtk.theme.name}".source = "${config.gtk.theme.package}/Sweet-Ambar-Blue-Dark";
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
