
{ config, pkgs, ... }:
{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        colors = {
          bright = {
            black = "#6272a4";
            blue = "#d6acff";
            cyan = "#a4ffff";
            green = "#69ff94";
            magenta = "#ff92df";
            red = "#ff6e6e";
            white = "#ffffff";
            yellow = "#ffffa5";
          };
        };
      };
    };
  };
}
