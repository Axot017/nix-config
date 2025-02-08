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
      extraConfig.pipewire.adjust-sample-rate = {
        "context.properties" = {
          "default.clock.rate" = 192000;
          #"defautlt.allowed-rates" = [ 192000 48000 44100 ];
          "defautlt.allowed-rates" = [ 192000 ];
          "default.clock.quantum" = 32;
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 32;
        };
      };
    };

  };
}
