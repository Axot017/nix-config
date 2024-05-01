{ config, pkgs, inputs, ... }: {
  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      # theme = "${import ./packages/sddm-chili.nix { inherit pkgs; }}";
    };
  };
}
