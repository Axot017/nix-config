{ config, pkgs, inputs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      theme = "${import ./packages/sddm-sugar-dark.nix { inherit pkgs; }}";
    };
  };
}
