{ pkgs, config, inputs, ... }: {
  extraPlugins = [
    pkgs.vimUtils.buildVimPlugin
    {
      name = "gopher.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "olexsmir";
        repo = "gopher.nvim";
        rev = "master";
        sha256 = "";
      };
    }
  ];
}
