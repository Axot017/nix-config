{ pkgs, config, inputs, ... }: {
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    roboto
    source-sans-pro
    font-awesome
  ];
}
