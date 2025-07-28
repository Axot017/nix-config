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
      bufferline-nvim
      copilot-lua
      lualine-nvim
      noice-nvim
      none-ls-nvim
      nui-nvim
      nvim-lspconfig
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
  ];
}
