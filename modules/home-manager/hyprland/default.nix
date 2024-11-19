{ config, pkgs, ... }:
let
  recordScreen = pkgs.writeShellScriptBin "record-screen" ''
    name="/home/axot/Videos/ScreenRecordings/$(date +"%Y-%m-%dT%H:%M:%S%z").mkv"
    wl-screenrec -f $name & echo $! > /tmp/screenrecording.pid
  '';
  recordScreenSelect = pkgs.writeShellScriptBin "record-screen-select" ''
    name="/home/axot/Videos/ScreenRecordings/$(date +"%Y-%m-%dT%H:%M:%S%z").mkv"
    wl-screenrec -g "$(slurp)" -f $name & echo $! > /tmp/screenrecording.pid
  '';
  stopRecording = pkgs.writeShellScriptBin "stop-recording" ''
    kill $(cat /tmp/screenrecording.pid) && rm /tmp/screenrecording.pid
    notificationResult=$(timeout 30s notify-send -A "GOTO=Open" -t 30000 "Video saved")
    if [ "$notificationResult" = "GOTO" ]; then
      nemo /home/axot/Videos/ScreenRecordings
    fi
  '';
in {
  imports =
    [ ./rofi.nix ./wallpapers.nix ./theme.nix ./ags/default.nix ./swaync.nix ];
  home.file.".config/hypr/scripts".source = ./scripts;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "ags"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
      "col.active_border" = "rgba(db42f8ff) rgba(74cff0ff) 45deg";
      input = {
        kb_layout = "pl,us";
        follow_mouse = 2;
      };
      decoration = {
        rounding = "8";
        drop_shadow = "yes";
        inactive_opacity = "0.8";
        shadow_range = "4";
        shadow_render_power = "3";
        blur = { enabled = "true"; };
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
      };
      animation = "global,1,2,default";
      monitor = ",preferred,auto,auto";
      "$mainMod" = "SUPER";
      bind = [
        ", mouse:276, pass, ^discord$"
        "$mainMod, T, exec, alacritty"
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

        "$mainMod CTRL, L, resizeactive, 10 0"
        "$mainMod CTRL, H, resizeactive, -10 0"
        "$mainMod CTRL, K, resizeactive, 0 -10"
        "$mainMod CTRL, J, resizeactive, 0 10"

        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, SPACE, exec, rofi -show drun -show-icons"
        "$mainMod, P, exec, rofi -show power-menu -modi power-menu:~/.config/hypr/scripts/rofi-power-menu"
        "$mainMod CTRL, S, exec, hyprshot -m region -o ~/Pictures/Screenshots"
        "$mainMod, S, exec, hyprshot -m output -o ~/Pictures/Screenshots"
        "$mainMod, N, exec, swaync-client -t -sw"
        "$mainMod, R, exec, ${recordScreen}/bin/record-screen"
        "$mainMod SHIFT, R, exec, ${recordScreenSelect}/bin/record-screen-select"
        "$mainMod, X, exec, ${stopRecording}/bin/stop-recording"
      ];
    };
  };
}
