{ pkgs, config, inputs, ... }: {
  programs.nixvim.extraConfigLua = ''
    -- For development
    vim.opt.rtp:append(vim.fn.expand('$HOME/Projects/fateweaver.nvim'))

    local fateweaver = require('fateweaver')

    multiterm.setup({
      log_level = 'DEBUG'
    })
  '';
}
