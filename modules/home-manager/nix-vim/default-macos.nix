{ pkgs, config, inputs, ... }: {
  imports = [
    ./extra.nix
    ./keymaps.nix
    ./options.nix
    ./plugins/default.nix
    ./theme.nix
  ];
  programs.nixvim = { enable = true; };
}
