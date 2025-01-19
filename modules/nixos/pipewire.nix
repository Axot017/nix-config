{ pkgs, config, inputs, ... }: {
  security.rtkit.enable = true;
    services.pulseaudio.enable = false;
    services.pulseaudio.support32Bit = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
