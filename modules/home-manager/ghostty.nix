{ config, pkgs, ... }:
{

  home.file.".config/ghostty/shaders".source = ./ghostty/shaders;
  programs = {
    ghostty = {
      enable = true;
      settings = {
        custom-shader = [
          "${config.home.homeDirectory}/.config/ghostty/shaders/cursor_smear.glsl"
        ];
      };
    };
  };
}
