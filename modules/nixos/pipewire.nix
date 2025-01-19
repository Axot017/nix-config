{ pkgs, config, inputs, ... }: {
  security.rtkit.enable = true;
  services = {
    pulseaudio = {
      enable = false;
      support32Bit = true;
    };
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

  };
}
