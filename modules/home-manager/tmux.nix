{ config, pkgs, ... }: {
  programs = {
    tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      prefix = "C-Space";
    };
  };
}
