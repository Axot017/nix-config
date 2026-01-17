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
        sha256 = "sha256-iXTmgdADtZFQVm+IN+JoPActGuO8r7VTeHKJdkEgmVo=";
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
  treesitter =
    with pkgs.vimPlugins;
    (nvim-treesitter.withPlugins (
      p: nvim-treesitter.passthru.allGrammars ++ [ treesitter-kulala-http-grammar ]
    ));
in
{
  home.file.".config/nvim".source = ./config;
  home.sessionVariables = {
    NVIM_ELIXIR_LS_PATH = "${pkgs.elixir-ls}/bin/elixir-ls";
  };
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      blink-cmp
      bufferline-nvim
      copilot-lua
      gitsigns-nvim
      gopher
      kulala-nvim
      lualine-nvim
      multiterm
      neotest
      neotest-elixir
      neotest-golang
      noice-nvim
      none-ls-nvim
      nui-nvim
      nvim-autopairs
      nvim-dap
      nvim-dap-go
      nvim-dap-ui
      nvim-lspconfig
      nvim-nio
      nvim-notify
      nvim-surround
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-web-devicons
      oil-nvim
      opencode-nvim
      plenary-nvim
      sidekick-nvim
      snacks-nvim
      tokyonight-nvim
      treesitter
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

      nodejs_22

      lsof

      ocamlPackages.ocaml-lsp
      ocamlPackages.ocamlformat

      tofu-ls

      yaml-language-server
    ];
  };
}
