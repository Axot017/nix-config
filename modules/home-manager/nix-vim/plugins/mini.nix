{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      test = { };
      indentscope = {
        draw = { animation.__raw = "function(s,n) return 10 end"; };
      };
    };
  };
}
