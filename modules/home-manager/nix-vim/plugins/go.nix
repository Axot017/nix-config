{
  pkgs,
  config,
  inputs,
  ...
}:
{
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "gopher.nvim";
      dependencies = with pkgs.vimPlugins; [
        plenary-nvim
        nvim-treesitter
        nvim-dap
      ];
      src = pkgs.fetchFromGitHub {
        owner = "olexsmir";
        repo = "gopher.nvim";
        rev = "master";
        sha256 = "sha256-6t2gdXv+S4xVmncnwFO7rIN64HUqhNaDVfdGlCoos+M=";
      };
    })
  ];
  programs.nixvim.extraConfigLua = ''
    require('gopher').setup({
      commands = {
        iferr = "${pkgs.iferr}/bin/iferr",
        go = "${pkgs.go}/bin/go",
        gomodifytags = "${pkgs.gomodifytags}/bin/gomodifytags",
        gotests = "${pkgs.gotests}/bin/gotests",
        impl = "${pkgs.impl}/bin/impl",
      }
    })
  '';
}
