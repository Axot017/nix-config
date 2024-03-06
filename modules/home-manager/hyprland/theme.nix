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
  xdg.configFile = {
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
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
