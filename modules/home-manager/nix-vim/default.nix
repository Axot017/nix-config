{ pkgs, config, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./extra.nix
    ./keymaps.nix
    ./options.nix
    ./plugins/default.nix
    ./theme.nix
  ];
  programs.nixvim = {
    enable = true;
    nixpkgs = { config.allowUnfree = true; };
  };
}
