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

      require("golang-tools").setup({
        commands = {
          iferr = "${pkgs.iferr}/bin/iferr",
          go = "${pkgs.go}/bin/go",
          gomodifytags = "${pkgs.gomodifytags}/bin/gomodifytags",
          gotests = "${pkgs.gotests}/bin/gotests",
          impl = "${pkgs.impl}/bin/impl",
        }
      })
    '';
    colorschemes.tokyonight = {
      enable = true;
      settings = { style = "storm"; };
    };
  };
}
