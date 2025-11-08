{ config, pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Mateusz Ledwoń";
          email = "mateuszledwon@duck.com";
        };
        push = {
          autoSetupRemote = true;
        };
      };
    };
  };
}
