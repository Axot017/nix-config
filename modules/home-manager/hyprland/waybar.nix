{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      modules-left = ["hyprland/workspaces"];
      modules-center = ["hyprland/window"];
      modules-right = ["cpu" "memory" "disk" "pulseaudio" "network" "battery" "clock" "temperature"];
      "hyprland/workspaces" = {
        format = "{icon}";
        tooltip = false;
        all-outputs = true;
        format-icons = {
          active = "";
          default = "";
        };
      };
      clock = {
        format = "<span color='#b4befe'> </span>{:%H:%M}";
      };
      pulseaudio = {
        format = "<span color='#b4befe'>{icon}</span> {volume}%";
        on-click = "pavucontrol";
        format-muted = "󰝟";
        tooltip = false;
        format-icons = {
          headphone = "";
          default = ["" "" "󰕾" "󰕾" "󰕾" "" "" ""];
        };
        scroll-step = 1;
      };
      network = {
        interface = "wlan0";
        format = "{ifname}";
        format-wifi = "{signalStrength}%<span color='#b4befe'> 󰤨</span>";
        format-ethernet = "{ipaddr}/{cidr} 󱎔 ";
        format-disconnected = "<span color='#b4befe'>󰖪 </span>No Network";
        format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        on-click = "";
        tooltip = false;
      };
      "hyprland/window" = {
          format = "{}";
          separate-outputs = true;
      };
      disk = {
          interval = 30;
          format = "<span color='#b4befe'>󰋊 </span>{percentage_used}%";
          path = "/";
      };
      memory = {
          interval = 10;
          format = "<span color='#b4befe'>󰒋 </span>{percentage}%";
          on-click = "alacritty -e htop";
      };
      cpu = {
          interval = 10;
          format = "<span color='#b4befe'> </span>{usage}%";
          on-click = "alacritty -e htop";
      };
      temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
      };
    };
  };
}
