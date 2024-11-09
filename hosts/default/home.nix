{ config, pkgs, ... }:
let
  nix-edit-script =
    import ../../modules/home-manager/scripts/nix-edit.nix { inherit pkgs; };

in {
  imports = [
    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/feh.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/htop.nix
    ../../modules/home-manager/hyprland/default.nix
    ../../modules/home-manager/nix-vim/default.nix
    ../../modules/home-manager/oh-my-posh.nix
    ../../modules/home-manager/ripgrep.nix
    ../../modules/home-manager/stylix.nix
    ../../modules/home-manager/thefuck.nix
    ../../modules/home-manager/yazi.nix
    ../../modules/home-manager/zoxide.nix
    ../../modules/home-manager/zsh.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "axot";
    homeDirectory = "/home/axot";
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.11"; # Please read the comment before changing.
    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };
    sessionVariables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";
    };
    packages = [ nix-edit-script ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
