{ config, pkgs, ... }: {
  home.file."wallpapers".source = ../../../wallpapers;
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${../../../wallpapers/witcher.jpg}" ];

      wallpaper = [ "monitor1,${../../../wallpapers/witcher.jpg}" ];
    };
  };

}
