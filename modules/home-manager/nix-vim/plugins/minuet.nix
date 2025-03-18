{ pkgs, config, inputs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.minuet-ai-nvim ];
    extraConfigLua = ''
      require('minuet').setup({ -- 
        cmp = {
          enable_auto_complete = false,
        },
        blink = {
          enable_auto_complete = false,
        },
        virtualtext = {
          show_on_completion_menu = true,
          auto_trigger_ft = {},
          keymap = {
            accept = '<C-y>',
          },
        },
        provider = "gemini",
        notify = "debug",
        provider_options = {
          gemini = {
            api_key = function()
              local path = os.getenv("HOME") .. "/.config/.secret/gemini"
              local f = io.open(path, "r")
              if f == nil then
                return ""
              end
              local key = f:read("*all")
              f:close()

              return string.gsub(key, "\n", "")
            end,
            optional = {},
          },
        }
      })
    '';
  };
}
