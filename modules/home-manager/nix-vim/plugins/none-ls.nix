{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        gofmt.enable = true;
        goimports.enable = true;
        golines.enable = true;
        hclfmt.enable = true;
        nixfmt.enable = true;
        nixpkgs-fmt.enable = true;
        ocamlformat.enable = true;
      };
      code_actions = {
        gitsigns = true;
      };
    };
  };
}
