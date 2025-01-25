{ pkgs, config, inputs, ... }: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "multiterm.nvim";
      dependencies = with pkgs.vimPlugins; [ plenary-nvim ];
      src = pkgs.fetchFromGitHub {
        owner = "Axot017";
        repo = "multiterm.nvim";
        rev = "master";
        sha256 = "sha256-SrYBn7FKyq6bCuv4aIkecRYNCXP2A6cmyDKxs5fNifU=";
      };
    })
  ];
  programs.nixvim.extraConfigLua = ''
    -- For development
    -- vim.opt.rtp:append(vim.fn.expand('$HOME/Projects/multiterm.nvim'))

    require('multiterm').setup()
  '';
}
