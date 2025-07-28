{
  pkgs,
  config,
  inputs,
  ...
}:
{
  home.file.".config/nvim".source = ./config;
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      blink-cmp
      copilot-lua
      nvim-lspconfig
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      oil-nvim
      snacks-nvim
      tokyonight-nvim
      bufferline-nvim
      nvim-web-devicons
      none-ls-nvim
    ];
  };
  home.packages = with pkgs; [
    nil
    gopls
    elixir-ls
    nixfmt-rfc-style
    lua-language-server
  ];
}
