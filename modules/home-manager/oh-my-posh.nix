{ config, pkgs, ... }: {
  programs = {
    oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      useTheme = "tokyonight_storm";
    };
  };
}
