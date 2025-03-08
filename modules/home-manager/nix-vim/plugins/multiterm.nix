{ pkgs, config, inputs, ... }: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "multiterm.nvim";
      dependencies = with pkgs.vimPlugins; [ plenary-nvim ];
      src = pkgs.fetchFromGitHub {
        owner = "Axot017";
        repo = "multiterm.nvim";
        rev = "insert-mode-on-open";
        sha256 = "sha256-Q3aGPJkbgFIiwnErAJXXluW6v+xfYIejkvglJHIbBec=";
      };
    })
  ];
  programs.nixvim.extraConfigLua = ''
    -- For development
    -- vim.opt.rtp:append(vim.fn.expand('$HOME/Projects/multiterm.nvim'))

    require('multiterm').setup()
  '';
}
