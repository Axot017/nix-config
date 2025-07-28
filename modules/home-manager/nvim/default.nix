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
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      blink-cmp
      bufferline-nvim
      copilot-lua
      copilot-lua
      gopher
      lualine-nvim
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
      snacks-nvim
      tokyonight-nvim
    ];
  };
  home.packages = with pkgs; [
    nil
    gopls
    elixir-ls
    nixfmt-rfc-style
    lua-language-server

    go
    iferr
    gomodifytags
    gotests
    impl
    delve
  ];
}
