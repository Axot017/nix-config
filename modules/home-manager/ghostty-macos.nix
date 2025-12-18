{ config, pkgs, ... }:
{
  home.file.".config/ghostty/shaders".source = ./ghostty/shaders;
  programs = {
    ghostty = {
      enable = true;
      package = pkgs.ghostty-bin;
      settings = {
        custom-shader = [
          "${config.home.homeDirectory}/.config/ghostty/shaders/cursor_smear.glsl"
          # "${config.home.homeDirectory}/.config/ghostty/shaders/sparks.glsl"
        ];
      };
    };
  };
}
