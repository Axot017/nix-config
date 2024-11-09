{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = {
    luasnip = { enable = true; };
    friendly-snippets = { enable = true; };
  };
}
