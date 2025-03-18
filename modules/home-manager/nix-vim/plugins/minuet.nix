{ pkgs, config, inputs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.minuet-ai-nvim ];

    extraConfigLua = ''
      require('minuet').setup({
        virtualtext = {
          auto_trigger_ft = {},
          keymap = {
            accept = '<A-A>',
          },
        },
        provider = "gemini",
        provider_options = {
          gemini = {
            stream = true,
            api_key = function()
              -- Read file ~/.config/.secrets/gemini
              local f = io.open(os.getenv("HOME") .. "/.config/.secrets/gemini", "r")
              if f == nil then
                return ""
              end
              local key = f:read("*all")
              f:close()
              vim.notify(key)

              return key
            end,
            optional = {},
          },
        }
      })
    '';
  };
}
