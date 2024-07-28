{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars;
        [ elixir ];
    };
    treesitter-textobjects = {
      enable = true;
      move = {
        gotoNextStart = {
          "]f" = {
            desc = "Go to next function";
            query = "@function.outer";
          };
        };
        gotoNextEnd = {
          "]F" = {
            desc = "Go to next function end";
            query = "@function.outer";
          };
        };
        gotoPreviousStart = {
          "]f" = {
            desc = "Go to previous function";
            query = "@function.outer";
          };
        };
        gotoPreviousEnd = {
          "]F" = {
            desc = "Go to previous function end";
            query = "@function.outer";
          };
        };
      };
      select = {
        keymaps = {
          af = {
            desc = "Select a function";
            query = "@function.outer";
          };
          "if" = {
            desc = "Select a function body";
            query = "@function.inner";
          };
          ac = {
            desc = "Select a class";
            query = "@class.outer";
          };
          ic = {
            desc = "Select a class body";
            query = "@class.inner";
          };
        };
      };
    };
  };
}
