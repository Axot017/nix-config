{ pkgs, config, inputs, ... }:
let
  tree-sitter-c-sharp = (pkgs.python3Packages.buildPythonPackage rec {
    pname = "tree-sitter-c-sharp";
    version = "0.23.1";
    format = "wheel";
    src = pkgs.python3Packages.fetchPypi {
      inherit version format;
      pname = "tree_sitter_c_sharp";
      sha256 = "sha256-qAJORmsvVhHG3JAyHyMthYSJPH+4i3XkqDGZL4d2FtI=";
      abi = "abi3";
      python = "cp39";
      dist = "cp39";
      platform =
        "manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64";
    };
  });
  tree-sitter-language-pack = (pkgs.python3Packages.buildPythonPackage rec {
    pname = "tree-sitter-language-pack";
    version = "0.6.1";
    format = "wheel";
    dependencies = with pkgs.python3Packages; [
      tree-sitter
      tree-sitter-c-sharp
    ];
    src = pkgs.python3Packages.fetchPypi {
      inherit version format;
      pname = "tree_sitter_language_pack";
      sha256 = "sha256-JA8JMO8dtoYAksgXSBOb9Rkvjt38wOqKXm9WjLi7cOY=";
      abi = "abi3";
      python = "cp39";
      dist = "cp39";
      platform = "manylinux2014_x86_64";
    };
  });
  vectorcode = (pkgs.python3Packages.buildPythonApplication rec {
    pname = "vectorcode";
    version = "0.4.12";
    format = "pyproject";
    build-system = [ pkgs.python3Packages.pdm-backend ];
    dependencies = with pkgs.python3Packages; [
      chromadb
      sentence-transformers
      pathspec
      tabulate
      shtab
      numpy
      psutil
      httpx
      tree-sitter
      tree-sitter-language-pack
      pygments
    ];
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
