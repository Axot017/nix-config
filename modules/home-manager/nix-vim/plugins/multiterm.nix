{ pkgs, config, inputs, ... }: {
  programs.nixvim.extraPlugins = [
    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "multiterm.nvim";
    #   dependencies = with pkgs.vimPlugins; [ plenary-nvim ];
    #   src = pkgs.fetchFromGitHub {
    #     owner = "Axot017";
    #     repo = "multiterm.nvim";
    #     rev = "master";
    #     sha256 = "sha256-NjGtUQnNeSzf/pe/eDjjwF3bSG8tguVBThZi4LWHZTI=";
    #   };
    # })
  ];
  programs.nixvim.extraConfigLua = ''
    -- For development
    vim.opt.rtp:append(vim.fn.expand('$HOME/Projects/multiterm.nvim'))

    local multiterm = require('multiterm')

    multiterm.setup({
      mappings = {
        n = {
          ["<esc>"] = function() multiterm.close_active() end
        }
      }
    })
  '';
}
