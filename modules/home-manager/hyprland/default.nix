{ config, pkgs, ... }:
let
  makeScreenshot = pkgs.writeShellScriptBin "make-screenshot" ''
    name=$(~/Pictures/Screenshots/$(date +"%Y-%m-%dT%H:%M:%S%z").png)
    result=$(grim $name)
    notificationResult=$(timeout 30s notify-send -t 30000 -A "COPY=Copy" -A "GOTO=Open" -i "$(name)" "Screenshot saved" "$(name)")
    if [ "$notificationResult" = "COPY" ]; then
      wl-copy < $name
    elif [ "$notificationResult" = "GOTO" ]; then
      xdg-open $name
    fi
  '';
in {
  imports = [ ./rofi.nix ./wallpapers.nix ./theme.nix ./ags/default.nix ];
  home.file.".config/hypr/scripts".source = ./scripts;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "ags"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
      input = { kb_layout = "pl,us"; };
      decoration = {
        rounding = "10";
        drop_shadow = "yes";
        shadow_range = "4";
        shadow_render_power = "3";
        blur = {
          enabled = "true";
          size = "3";
          passes = "1";
        };
      };
      master = {
        new_on_top = "false";
        orientation = "right";
      };
      general = {
        layout = "master";
        gaps_in = "4";
        gaps_out = "8";
        border_size = "2";
        # col.active_border = "rgba(db42f8ff) rgba(74cff0ff) 45deg";
      };
      animation = "global,1,2,default";
      monitor = ",preferred,auto,auto";
      "$mainMod" = "SUPER";
      bind = [
        ", mouse:276, pass, ^discord$"
        "$mainMod, T, exec, wezterm start"
        "$mainMod, Q, killactive"

        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        "$mainMod, F, fullscreen"

        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod ALT, L, resizeactive, 10 0"
        "$mainMod ALT, H, resizeactive, -10 0"
        "$mainMod ALT, K, resizeactive, 0 -10"
        "$mainMod ALT, J, resizeactive, 0 10"

        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, SPACE, exec, rofi -show drun -show-icons"
        "$mainMod, P, exec, rofi -show power-menu -modi power-menu:~/.config/hypr/scripts/rofi-power-menu"
        ''
          $mainMod SHIFT, S, exec, grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +"%Y-%m-%dT%H:%M:%S%z").png''
        "$mainMod, S, exec, ${makeScreenshot}/bin/make-screenshot"
        ''
          $mainMod, R, exec, wl-screenrec -f ~/Videos/ScreenRecordings/$(date +"%Y-%m-%dT%H:%M:%S%z").mkv & echo $! > /tmp/screenrecording.pid''
        ''
          $mainMod SHIFT, R, exec, wl-screenrec -g "$(slurp)" -f ~/Videos/ScreenRecordings/$(date +"%Y-%m-%dT%H:%M:%S%z").mkv & echo $! > /tmp/screenrecording.pid''
        "$mainMod, S, exec, kill $(cat /tmp/screenrecording.pid) && rm /tmp/screenrecording.pid"
      ];
    };
  };
}
