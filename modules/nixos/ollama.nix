{ config, pkgs, inputs, ... }: {
  nixpkgs.config.rocmSupport = true;
  services = {
    ollama = {
      enable = true;
      acceleration = "rocm";
      rocmOverrideGfx = "10.1.0";
    };
  };
}
