{ config, pkgs, inputs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = [
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.network
      inputs.ags.packages.${pkgs.system}.wireplumber
    ];
  };
}
