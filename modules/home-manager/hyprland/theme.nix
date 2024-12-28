{ config, pkgs, ... }:
let
  sweet = import ./packages/sweet-theme.nix { inherit pkgs; };
  candy = import ./packages/candy-icons-theme.nix { inherit pkgs; };
in {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Candy-Icons";
      package = candy;
    };
    cursorTheme = {
      name = "Sweet-cursors";
      package = sweet;
    };
  };
  home.file = {
    ".icons/${config.gtk.cursorTheme.name}".source =
      "${config.gtk.cursorTheme.package}/${config.gtk.theme.name}/kde/cursors/Sweet-cursors";
    ".icons/${config.gtk.iconTheme.name}".source =
      "${config.gtk.iconTheme.package}/${config.gtk.iconTheme.name}";
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
