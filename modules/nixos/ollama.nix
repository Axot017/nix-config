{ config, pkgs, inputs, ... }: {
  nixpkgs.config.rocmSupport = true;
  services = {
    ollama = {
      enable = true;
      rocmOverrideGfx = "10.1.0";
    };
  };
}
