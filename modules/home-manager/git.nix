{ config, pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Mateusz Ledwoń";
      userEmail = "mateuszledwon@duck.com";
      extraConfig = {
        push = {
          autoSetupRemote = true;
	      };
      };
    };
  };
}
