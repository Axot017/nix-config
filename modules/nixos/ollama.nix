{ config, pkgs, inputs, ... }: {
  nixpkgs.config.rocmSupport = true;
  services = { ollama = { enable = true; }; };
}
