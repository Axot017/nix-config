{ config, pkgs, ... }:
{
  programs = {
    thefuck = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
