{ config, pkgs, ... }:
{

  home.file.".config/ghostty/shaders".source = ./ghostty/shaders;
  programs = {
    ghostty = {
      enable = true;
    };
  };
}
