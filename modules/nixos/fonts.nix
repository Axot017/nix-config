{ pkgs, config, inputs, ... }: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    roboto
    source-sans-pro
    font-awesome
  ];
}
