{ pkgs, config, inputs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.minuet-ai-nvim ];
    extraConfigLua = ''
      require('minuet').setup({
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
        provider_options = {
          gemini = {
            stream = true,
            api_key = function()
              local path = os.getenv("HOME") .. "/.config/.secret/gemini"
              vim.notify(path)
              local f = io.open(path, "r")
              if f == nil then
                return ""
              end
              local key = f:read("*all")
              vim.notify(key)
              f:close()

              return key
            end,
            optional = {},
          },
        }
      })
    '';
  };
}
