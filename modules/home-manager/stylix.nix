{ config, pkgs, ... }: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  };
}
