{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
  ];
  services = {
    xserver.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "where_is_my_sddm_theme";
      settings = {
        General = {
          DefaultSession = "hyprland.desktop";
        };
      };
    };
  };
}
