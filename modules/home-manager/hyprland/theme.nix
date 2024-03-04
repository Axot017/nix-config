{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Sweet";
      package = pkgs.sweet;
    };
    iconTheme = {
      name = "SweetIcon";
      package = pkgs.sweet;
    };
    cursorTheme = {
      name = "SweetCursor";
      package = pkgs.sweet;
    };
  };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
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
