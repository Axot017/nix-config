{ pkgs, config, inputs, ... }: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "blink-cmp-avante";
      src = pkgs.fetchFromGitHub {
        owner = "Kaiser-Yang";
        repo = "blink-cmp-avante";
        rev = "master";
        sha256 = "sha256-1ltVpWN+JEAdC6g8IIGfTEpTflpuZ/jbN4ByXbjhPEU=";
      };
    })
  ];
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "none";
        "<Tab>" = [ "select_next" "fallback" ];
        "<S-Tab>" = [ "select_prev" "fallback" ];
        "<CR>" = [ "accept" "fallback" ];
      };
      sources = {
        default = [ "avante" "lsp" "path" "snippets" "buffer" ];
        providers = {
          avante = {
            module = "blink-cmp-avante";
            name = "Avante";
            opts = { };
          };
        };
      };
      completion.list.selection = {
        auto_insert = true;
        preselect = false;
      };
    };
  };
}
