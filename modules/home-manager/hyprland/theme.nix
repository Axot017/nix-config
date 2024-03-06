{ config, pkgs, ... }:
let
  sweet = import ./packages/sweet-theme.nix { inherit pkgs; };
in
{
  gtk = {
    enable = true;
    theme = {
      name = "Sweet-Ambar-Blue-Dark";
      package = sweet;
    };
  };
  home.file = {
    ".theme/${config.gtk.theme.name}".source = "${config.gtk.theme.package}/${config.gtk.theme.name}";
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
