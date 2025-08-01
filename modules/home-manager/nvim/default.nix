{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  gopher = (
    pkgs.vimUtils.buildVimPlugin {
      name = "gopher.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "olexsmir";
        repo = "gopher.nvim";
        rev = "master";
        sha256 = "sha256-8F8hi29YJSmu/TdfobznE1jM3grUqdr0MBOp7ZlyCTA=";
      };
    }
  );
  multiterm = (
    pkgs.vimUtils.buildVimPlugin {
      name = "multiterm.nvim";
      dependencies = with pkgs.vimPlugins; [ plenary-nvim ];
      src = pkgs.fetchFromGitHub {
        owner = "Axot017";
        repo = "multiterm.nvim";
        rev = "master";
        sha256 = "sha256-9NoTj3lF/KZYPZIm7Jo7D9rfmVJ7XPxGCjXeqPylChw=";
      };
    }
  );
  treesitter-kulala-http-grammar = pkgs.tree-sitter.buildGrammar {
    language = "kulala_http";
    version = "5.3.1";
    src = pkgs.fetchFromGitHub {
      owner = "mistweaverco";
      repo = "kulala.nvim";
      rev = "902fc21e8a3fee7ccace37784879327baa6d1ece";
      hash = "sha256-whQpwZMEvD62lgCrnNryrEvfSwLJJ+IqVCywTq78Vf8=";
    };
    location = "lua/tree-sitter";
  };
in
{
  home.file.".config/nvim".source = ./config;
  home.sessionVariables = {
    NVIM_ELIXIR_LS_PATH = "${pkgs.elixir-ls}/bin/elixir-ls";
    NVIM_KULALA_HTTP_GRAMMAR_PATH = "${treesitter-kulala-http-grammar}";
  };
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      treesitter-kulala-http-grammar
      blink-cmp
      bufferline-nvim
      copilot-lua
      gitsigns-nvim
      gopher
      multiterm
      lualine-nvim
      neotest
      neotest-elixir
      neotest-go
      noice-nvim
      none-ls-nvim
      nui-nvim
      nvim-dap
      nvim-dap-go
      nvim-dap-ui
      nvim-lspconfig
      nvim-nio
      kulala-nvim
      nvim-notify
      nvim-treesitter-context
      nvim-treesitter-textobjects
      (nvim-treesitter.withPlugins (p: nvim-treesitter.passthru.allGrammars))
      nvim-web-devicons
      oil-nvim
      plenary-nvim
      snacks-nvim
      tokyonight-nvim
    ];
    extraPackages = with pkgs; [
      nil
      gopls
      nixfmt-rfc-style
      lua-language-server

      go
      iferr
      gomodifytags
      gotests
      impl
      delve

      nodejs_20
    ];
  };
}
