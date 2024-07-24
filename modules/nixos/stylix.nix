{ config, pkgs, inputs, ... }: {
  stylix = {
    enable = true;
    image = ./wallpapers/witcher.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    polarity = "dark";
  };
}
