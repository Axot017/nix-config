{ pkgs, config, inputs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.minuet-ai-nvim ];
    extraConfigLua = ''
      -- vim.opt.rtp:append(vim.fn.expand('$HOME/Projects/minuet-ai.nvim'))

      require('minuet').setup({
        cmp = {
          enable_auto_complete = true,
        },
        blink = {
          enable_auto_complete = false,
        },
        virtualtext = {
          show_on_completion_menu = true,
          auto_trigger_ft = { "*" },
          keymap = {
            accept = '<C-y>',
          },
        },
        provider = "openai_fim_compatible",
        throttle = 200,
        debounce = 150,
        n_completions = 1,
        context_window = 512,
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
          openai_fim_compatible = {
            name = 'Ollama',
            api_key = 'TERM',
            end_point = 'http://localhost:11434/v1/completions',
            model = 'qwen2.5-coder:7b',
            optional = {
              max_tokens = 56,
              top_p = 0.9,
            },
          },
        }
      })
    '';
  };
}
