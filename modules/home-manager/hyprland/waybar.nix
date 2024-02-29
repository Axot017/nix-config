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

window#waybar {
  background: transparent;
}

#custom-arch, #workspaces {
  border-radius: 8px;
  background-color: #11111b;
  color: #b4befe;
	margin-left: 8px;
  padding-left: 4px;
  padding-right: 4px;
}

#custom-arch {
  font-size: 20px;
  color: #b4befe;
}

#window {
  border-radius: 8px;
  background-color: #11111b;
  color: #cdd6f4;
  padding-left: 8px;
  padding-right: 8px;
}

#workspaces button {
  background: #11111b;
  color: #b4befe;
}

#clock, #pulseaudio, #network, #cpu, #memory, #disk, #temperature {
  background-color: #11111b;
  color: #cdd6f4;
  padding-left: 8px;
  padding-right: 8px;
}

#cpu {
  border-top-left-radius: 8px;
  border-bottom-left-radius: 8px;
}

#disk {
  border-top-right-radius: 8px;
  border-bottom-right-radius: 8px;
}

#clock, #pulseaudio, #network {
  border-radius: 8px;
}

#clock, #pulseaudio, #network, #disk {
  margin-right: 8px;
}

#custom-arch, #workspaces, #window, #cpu, #memory, #clock, #pulseaudio, #network, #disk {
  margin-top: 8px;
  padding: 4px 8px;
}

window#waybar.empty #window {  
 background: none;  
} 
    '';
  };
}
