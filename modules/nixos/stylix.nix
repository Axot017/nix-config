{ config, pkgs, inputs, lib, ... }: {
  stylix = {
    enable = true;
    image = ../../wallpapers/witcher.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    polarity = "dark";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMonoNL Nerd Font Mono";
      };
    };
    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX Cursor";
      size = 16;
    };
  };
}
