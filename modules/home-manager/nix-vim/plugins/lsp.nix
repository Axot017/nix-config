{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    keymaps = {
      diagnostic = {
        "]d" = "goto_next";
        "[d" = "goto_prev";
      };
      lspBuf = { "<leader>ca" = "code_action"; };
    };
    servers = {
      lua-ls = { enable = true; };
      rust-analyzer = { enable = true; };
      nil_ls = { enable = true; };
      gleam = {
        enable = true;
        cmd = [ "/home/axot/Projects/gleam/target/debug/gleam" "lsp" ];
      };
      gopls = { enable = true; };
      html = { enable = true; };
      htmx = { enable = true; };
      jsonls = { enable = true; };
      terraformls = { enable = true; };
      yamlls = { enable = true; };
      pyright = { enable = true; };
    };
  };
}
