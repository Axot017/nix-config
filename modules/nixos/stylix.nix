{ config, pkgs, inputs, ... }: {
  stylix = {
    enable = true;
    image = ./wallpapers/witcher.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-moon.yaml";
    polarity = "dark";
    fonts = {
      monospace = {
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
        name = "JetBrainsMonoNL Nerd Font Mono";
      };
    };
    targets = { nixvim.enable = false; };
  };
}
