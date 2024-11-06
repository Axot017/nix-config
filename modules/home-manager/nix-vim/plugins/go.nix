{ pkgs, config, inputs, ... }: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "gopher.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "olexsmir";
        repo = "gopher.nvim";
        rev = "master";
        sha256 = "sha256-ExB8jSmjMBuNJ8XQ8pVEaOo6moIMyNogBMHlDc0frHA=";
      };
    })
  ];
  programs.nixvim.extraConfigLua = ''
    require('gopher').setup()
  '';
}
