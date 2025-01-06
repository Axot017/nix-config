{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.dap = {
    enable = true;
    adapters = { servers = { }; };
    configurations = { };
    extensions = {
      dap-go = { enable = true; };
      dap-ui = { enable = true; };
      dap-virtual-text = { enable = true; };
    };
  };
}
