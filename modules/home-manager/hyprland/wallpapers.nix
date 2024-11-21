{ config, pkgs, ... }: {
  home.file."Wallpapers".source = ./wallpapers;
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "./wallpapers/witcher.jpg" ];

      wallpaper = [ "monitor1,./wallpapers/witcher.jpg" ];
    };
  };

}
