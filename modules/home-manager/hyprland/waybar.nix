{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      modules-left = ["hyprland/window"];
      modules-center = ["cpu" "memory" "pulseaudio" "clock" "network" "disk" "temperature"];
      modules-right = ["hyprland/workspaces"];
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
        format = "{:%d-%m-%Y %H:%M}";
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
        interface = "wlo1";
        format = "{ifname}";
        format-wifi = "{signalStrength}%<span color='#b4befe'> {icon}</span>";
        format-ethernet = "<span color='#b4befe'> 󱎔 </span>";
        format-disconnected = "<span color='#b4befe'> 󰖪 </span>";
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
          format = "{percentage_used}%<span color='#b4befe'> 󰋊</span>";
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
          format = "{temperatureC}°C <span color='#b4befe'>{icon}</span>";
          format-icons = ["" "" ""];
      };
    };
    style = ''
* {
  border: none;
  font-family: 'JetBrainsMonoNL Nerd Font Mono', 'Symbols Nerd Font Mono';
  font-size: 16px;
  min-height: 0px;
}

#clock, #pulseaudio, #network, #cpu, #memory, #disk, #temperature, #clock, #window, #workspaces {
  background-color: #11111b;
  color: #cdd6f4;
  margin-top: 8px;
  margin-left: 4px;
  margin-right: 4px;
}

#window {
}

window#waybar {
  background: transparent;
}

window#waybar.empty #window {  
 background: none;  
} 

#cpu {
}

#memory {
}

#pulseaudio {
}

#clock {
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;

  border-bottom-left-radius: 32px;
  border-bottom-right-radius: 32px;
}

#network {
}

#disk {
}

#temperature {
}

#workspaces {
}

#workspaces button {
  background: #11111b;
  color: #b4befe;
}

    '';
  };
}
