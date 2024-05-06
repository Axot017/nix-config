{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.dap = {
    enable = true;
    adapters = { executables = { lldb = { command = "lldb-vscode"; }; }; };
    configurations = {
      rust = [{
        name = "Launch rust";
        type = "lldb";
        request = "launch";
        cwd = "\${workspaceFolder}";
        program.__raw = ''
          function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end
        '';
      }];
    };
    extensions = {
      dap-ui = { enable = true; };
      dap-virtual-text = { enable = true; };
    };
  };
}
