{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = {
    dap = {
      enable = true;
      adapters = { servers = { }; };
      configurations = { };
    };
    dap-go = { enable = true; };
    dap-ui = { enable = true; };
  };
}
