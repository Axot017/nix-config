{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          bg0 = mkLiteral "#242424E6";
          bg1 = mkLiteral "#7E7E7E80";
          bg2 = mkLiteral "#0860f2E6";

          fg0 = mkLiteral "#DEDEDE";
          fg1 = mkLiteral "#FFFFFF";
          fg2 = mkLiteral "#DEDEDE80";

          margin = 0;
          padding = 0;
          spacing = 0;
        };

        window = {

          location = mkLiteral "north";
          anchor = mkLiteral "center";
          y-offset = 250;
          width = 640;
          border-radius = 8;
        };

        inputbar = {
          padding = mkLiteral "12px";
          spacing = mkLiteral "12px";
          children = map mkLiteral [
            "icon-search"
            "entry"
          ];
        };

        icon-search = {
          expand = false;
          filename = "search";
          size = mkLiteral "0px";
        };

        "icon-search, entry, element-icon, element-text" = {
          vertical-align = mkLiteral "0.5";
        };

        "entry" = {
          font = mkLiteral "inherit";

          placeholder = "Search";
        };

        message = {
          border = mkLiteral "2px 0 0";
        };

        textbox = {
          padding = mkLiteral "8px 24px";
        };

        listview = {
          lines = 10;
          columns = 1;

          fixed-height = false;
          border = mkLiteral "1px 0 0";
        };

        element = {
          padding = mkLiteral "8px 16px";
          spacing = mkLiteral "16px";
        };

        "element selected normal, element selected active" = { };

        element-icon = {
          size = mkLiteral "1em";
        };

      };
  };
}
