{ pkgs, config, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins/default.nix
  ];
  programs.nixvim = {
    enable = true;
    extraConfigLua = ''
      print("Hello from NixVim!");
    '';
    colorschemes.tokyonight = {
      enable = true;
      settings = { style = "storm"; };
    };
  };
}
