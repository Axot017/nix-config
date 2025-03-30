{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        black.enable = true;
        gofmt.enable = true;
        goimports.enable = true;
        hclfmt.enable = true;
        mix.enable = true;
        nixfmt.enable = true;
        ocamlformat.enable = true;
      };
      code_actions = { gitsigns.enable = true; };
    };
  };
}
