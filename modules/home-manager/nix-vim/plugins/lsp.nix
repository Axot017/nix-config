{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      lua-ls = { enable = true; };
      rust-analyzer = { enable = true; };
      nil_ls = { enable = true; };
      gleam = { enable = true; };
      gopls = { enable = true; };
      html = { enable = true; };
      htmx = { enable = true; };
      jsonls = { enable = true; };
      terraformls = { enable = true; };
      yamlls = { enable = true; };
    };
  };
}
