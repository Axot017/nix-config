# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ stdenv.cc.cc libepoxy fontconfig ];

  imports = [
    # Include the results of the hardware scan.
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/i18n.nix
    ../../modules/nixos/pipewire.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/xserver.nix
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Name = "Computer";
        ControllerMode = "dual";
        FastConnectable = "true";
        Experimental = "true";
      };
      Policy = { AutoEnable = "true"; };
      LE = { EnableAdvMonInterleaveScan = "true"; };
    };
  };
  boot.kernelModules = [ "nct6775" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ hid-tmff2 ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  services.xserver.videoDrivers = [ "amdgpu" ];
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.axot = {
    isNormalUser = true;
    description = "Axot";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  programs.kdeconnect.enable = true;
  programs.zsh.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv = { enable = true; };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "axot" = import ./home.nix; };
    backupFileExtension = "backup";

  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.rocmSupport = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    grim
    slurp
    libsForQt5.qt5.qtquickcontrols
    libsForQt5.qt5.qtgraphicaleffects
    protonup
    wev
    lm_sensors
    git
    libnotify
    discord
    unzip
    nemo
    cliphist
    wl-clipboard
    postman
    gnumake
    vscode-extensions.vadimcn.vscode-lldb
    mangohud
    fzf
    ffmpeg
    cmake
    ninja
    clang
    pkg-config
    slack
    wl-screenrec
    inotify-tools
    inputs.zen-browser.packages."${system}".default
    hyprshot
    hyprpicker
    unrar
    jq
    claude-code
    pavucontrol
    ollama-rocm
    bruno
    oversteer
    opencode
    beekeeper-studio
    blueman
    ngrok
  ];
  nixpkgs.config.permittedInsecurePackages = [ "beekeeper-studio-5.2.12" ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  virtualisation = {
    podman = { enable = true; };
    docker = {
      enable = true;
      enableOnBoot = true;
      liveRestore = false;
      autoPrune.enable = true;
    };
  };
}
