{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    keymaps = {
      diagnostic = {
        "]d" = "goto_next";
        "[d" = "goto_prev";
      };
      lspBuf = {
        "<leader>ca" = "code_action";
        "<leader>r" = "rename";
      };
    };
    servers = {
      lua-ls = { enable = true; };
      nil-ls = { enable = true; };
      gopls = { enable = true; };
      html = { enable = true; };
      htmx = { enable = true; };
      jsonls = { enable = true; };
      terraformls = { enable = true; };
      yamlls = { enable = true; };
      pyright = { enable = true; };
      elixirls = { enable = true; };
      tsserver = { enable = true; };
      typst-lsp = { enable = true; };
    };
  };
}
