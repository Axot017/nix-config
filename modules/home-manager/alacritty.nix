
{ config, pkgs, ... }:
{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        font = {
          size = 12.0;
          bold = {
            family = "JetBrainsMonoNL Nerd Font Mono";
            style = "Bold";
          };
          bold_italic = {
            family = "JetBrainsMonoNL Nerd Font Mono";
            style = "SemiBold Italic";
          };
          italic = {
            family = "JetBrainsMonoNL Nerd Font Mono";
            style = "Italic";
          };
          normal = {
            family = "JetBrainsMonoNL Nerd Font Mono";
            style = "Regular";
          };
        };
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
          cursor = {
            cursor = "CellForeground";
            text = "CellBackground";
          };
          footer_bar = {
            background = "#282a36";
            foreground = "#f8f8f2";
          };
          hints = {
            start = {
              background = "#282a36";
              foreground = "#f1fa8c";
            };
            end = {
              background = "#f1fa8c";
              foreground = "#282a36";
            };
          };
          line_indicator = {
            background = "None";
            foreground = "None";
          };
          normal = {
            black = "#21222c";
            blue = "#bd93f9";
            cyan = "#8be9fd";
            green = "#50fa7b";
            magenta = "#ff79c6";
            red = "#ff5555";
            white = "#f8f8f2";
            yellow = "#f1fa8c";
          };
          primary = {
            background = "#282a36";
            bright_foreground = "#ffffff";
            foreground = "#f8f8f2";
          };
          search = {
            focused_match = {
              background = "#ffb86c";
              foreground = "#44475a";
            };
            matches = {
              background = "#50fa7b";
              foreground = "#44475a";
            };
          };
          selection = {
            background = "#44475a";
            text = "CellForeground";
          };
          vi_mode_cursor = {
            cursor = "CellForeground";
            text = "CellBackground";
          };
        };
      };
    };
  };
}
