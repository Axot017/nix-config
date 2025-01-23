{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        gofmt.enable = true;
        goimports.enable = true;
        hclfmt.enable = true;
        nixfmt.enable = true;
        ocamlformat.enable = true;
        black.enable = true;
      };
      code_actions = { gitsigns.enable = true; };
    };
  };
}
