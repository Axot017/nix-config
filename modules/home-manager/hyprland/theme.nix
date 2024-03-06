{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "dracula-icon";
      package = pkgs.dracula-icon-theme;
    };
    cursorTheme = {
      name = "dracula-cursor";
      package = pkgs.dracula-icon-theme;
    };
  };
  #xdg.configFile = {
  #  "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  #  "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  #  "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  #};
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
