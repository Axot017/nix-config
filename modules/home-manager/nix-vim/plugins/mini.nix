{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      indentscope = {
        draw = { animation.__raw = "function(s,n) return 10 end"; };
      };
      files = {
        mappings = {
          reveal_cwd = "<leader>.";
          close = "<esc>";
        };
      };
    };
  };
}
