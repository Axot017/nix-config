{ pkgs, config, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins/default.nix
  ];
  programs.nixvim = {
    enable = true;
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "golang-tools.nvim";
        dependencies = with pkgs.vimPlugins; [ plenary-nvim nvim-treesitter ];
        src = pkgs.fetchFromGitHub {
          owner = "Axot017";
          repo = "golang-tools.nvim";
          rev = "master";
          sha256 = "sha256-irv/Edi0wuMOcBxqHl4ZKAwFS4akv92RFpjR+z+mWlE=";
        };
      })
    ];
    extraConfigLua = ''
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
