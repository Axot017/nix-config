{ pkgs, config, inputs, ... }: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "multiterm.nvim";
      dependencies = with pkgs.vimPlugins; [ plenary-nvim ];
      src = pkgs.fetchFromGitHub {
        owner = "Axot017";
        repo = "fateweaver.nvim";
        rev = "master";
        sha256 = "sha256-Jlf072IEIsEi21JW7mS39Lj+r0PjltBWLrWetUiw5ts=";
      };
    })
  ];
  programs.nixvim.keymaps = [{
    mode = "i";
    key = "<C-y>";
    action.__raw = ''
      function()
        require('fateweaver').accept_completion()
      end
    '';
    options = { silent = true; };
  }];
  programs.nixvim.extraConfigLua = ''
    -- For development
    -- vim.opt.rtp:append(vim.fn.expand('$HOME/Projects/fateweaver.nvim'))

    local fateweaver = require('fateweaver')

    fateweaver.setup({
      log_level = 'DEBUG',
      logger_fn = require('fateweaver.logger').file_logger(vim.fn.stdpath("cache") .. "/fateweaver.log")
    })
  '';
}
