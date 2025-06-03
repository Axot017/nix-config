{ pkgs, config, inputs, ... }: {
  # programs.nixvim.extraPlugins = [
  #   (pkgs.vimUtils.buildVimPlugin {
  #     name = "fateweaver.nvim";
  #     dependencies = with pkgs.vimPlugins; [ plenary-nvim ];
  #     src = pkgs.fetchFromGitHub {
  #       owner = "Axot017";
  #       repo = "fateweaver.nvim";
  #       rev = "v0.1.0";
  #       sha256 = "sha256-qISx9e7SqGVpIsxwSZJUdnPEKG9hWwvmCxyB8hLa+Os=";
  #     };
  #   })
  # ];
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
    vim.opt.rtp:append(vim.fn.expand('$HOME/Projects/fateweaver.nvim'))

    local fateweaver = require('fateweaver')

    fateweaver.setup({
      log_level = 'DEBUG',
      logger_fn = require('fateweaver.logger').file_logger(vim.fn.stdpath("cache") .. "/fateweaver.log"),
      completion_endpoint = "https://api.runpod.ai/v2/k5hs1n2alid4ei/openai/v1/completions",
      model_name = "zed-industries/zeta",
      api_key = function()
        local path = os.getenv("HOME") .. "/.config/.secret/runpod"
        local f = io.open(path, "r")
        if f == nil then
          return ""
        end
        local key = f:read("*all")
        f:close()

        return string.gsub(key, "\n", "")
      end
    })
  '';
}
