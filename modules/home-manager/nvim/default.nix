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
      nvim-treesitter.withAllGrammars
      tokyonight-nvim
      oil-nvim
      snacks-nvim
      blink-cmp
      copilot-lua
      nvim-treesitter-textobjects
      nvim-treesitter-context

    ];
  };
}
