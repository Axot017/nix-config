{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      files = {
        mappings = {
          reveal_cwd = "<leader>.";
          close = "<esc>";
        };
      };
    };
  };
}
