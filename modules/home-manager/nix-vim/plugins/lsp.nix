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
      elixirls = { enable = true; };
      gopls = { enable = true; };
      html = { enable = true; };
      htmx = { enable = true; };
      jsonls = { enable = true; };
      lua_ls = { enable = true; };
      nil_ls = { enable = true; };
      pyright = { enable = true; };
      terraformls = { enable = true; };
      ts_ls = { enable = true; };
      yamlls = { enable = true; };
    };
  };
}
