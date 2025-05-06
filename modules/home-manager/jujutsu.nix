{ config, pkgs, ... }: {
  programs = {
    jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "Mateusz Ledwoń";
          email = "mateuszledwon@duck.com";
        };
      };
    };
  };
}
