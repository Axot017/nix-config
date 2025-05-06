{ pkgs, config, inputs, ... }: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "multiterm.nvim";
      dependencies = with pkgs.vimPlugins; [ plenary-nvim ];
      src = pkgs.fetchFromGitHub {
        owner = "Axot017";
        repo = "multiterm.nvim";
        rev = "master";
        sha256 = "sha256-9NoTj3lF/KZYPZIm7Jo7D9rfmVJ7XPxGCjXeqPylChw=";
      };
    })
  ];
  programs.nixvim.extraConfigLua = ''
    -- For development
    -- vim.opt.rtp:append(vim.fn.expand('$HOME/Projects/multiterm.nvim'))

    local multiterm = require('multiterm')

    multiterm.setup({
      mappings = {
        n = {
          ["<esc>"] = function() 
            multiterm.close_active() 
          end,
        },
      }
    })
  '';
}
