{ config, pkgs, ... }:
{
  imports = [
    ./waybar.nix
    ./mako.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    
  };
}
