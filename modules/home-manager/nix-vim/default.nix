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
      vim.opt.rtp:append(vim.fn.expand('$HOME/Projects/golang-tools.nvim'))
    '';
    colorschemes.tokyonight = {
      enable = true;
      settings = { style = "storm"; };
    };
  };
}
