{ config, pkgs, ... }:
let
  sweet = import ./packages/sweet-theme.nix { inherit pkgs; };
  sweet-cursors = import ./packages/sweet-cursors.nix { inherit pkgs; };
  candy = import ./packages/candy-icons-theme.nix { inherit pkgs; };
in
{
  gtk = {
    enable = true;
    theme = {
      name = "Sweet-Ambar-Blue-Dark";
      package = sweet;
    };
    iconTheme = {
      name = "Candy-Icons";
      package = candy;
    };
    cursorTheme = {
      name = "Sweet-Ambar-Blue-Dark";
      package = sweet-cursors;
    };
  };
  home.file = {
    ".themes/${config.gtk.theme.name}".source = "${config.gtk.theme.package}/${config.gtk.theme.name}";
    ".themes/${config.gtk.cursorTheme.name}/cursors".source = "${config.gtk.cursorTheme.package}/${config.gtk.cursorTheme.name}/cursors";
    ".icons/${config.gtk.iconTheme.name}".source = "${config.gtk.iconTheme.package}/${config.gtk.iconTheme.name}";
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
