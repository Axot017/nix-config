{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = [
      inputs.ags.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
      inputs.ags.packages.${pkgs.stdenv.hostPlatform.system}.network
      inputs.ags.packages.${pkgs.stdenv.hostPlatform.system}.wireplumber
    ];
  };
}
