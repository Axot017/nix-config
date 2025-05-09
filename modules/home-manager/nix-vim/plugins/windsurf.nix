{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = {
    windsurf-nvim = {
      enable = true;
      settings = {
        enable_cmp_source = false;
        virtual_text = {
          enabled = true;
          key_bindings = { accept = "<C-y>"; };
        };
      };
    };
  };
}
