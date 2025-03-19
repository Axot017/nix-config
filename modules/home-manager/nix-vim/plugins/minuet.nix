{ pkgs, config, inputs, ... }:
let
  vectorcode = (pkgs.python3Packages.buildPythonPackage rec {
    pname = "vectorcode";
    version = "0.4.12";
    format = "wheel";
    src = pkgs.python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-Yu4N7EAGOAVdAxBMTbrO/j5DzDgtlmpxOJ/SFzyI7M4=";
    };
  });
in {
  home = { packages = [ vectorcode ]; };
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
        throttle = 0,
        debounce = 150,
        n_completions = 1,
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

      vim.cmd[[
        Minuet virtualtext enable
      ]]
    '';
  };
}
