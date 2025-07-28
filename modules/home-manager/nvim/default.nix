{
  pkgs,
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
      nvim-notify
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
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
