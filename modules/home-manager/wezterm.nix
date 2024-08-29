{ config, pkgs, inputs, ... }: {
  programs = {
    wezterm = {
      enable = true;
      extraConfig = ''
        local wezterm = require 'wezterm'

        local config = wezterm.config_builder()

        config.enable_wayland = false
        config.front_end = "WebGpu"
        config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono")

        return config
      '';
    };
  };
}
