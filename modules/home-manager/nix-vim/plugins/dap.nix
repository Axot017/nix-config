{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = {
    dap = {
      enable = true;
      adapters = { servers = { }; };
      configurations = { };
    };
    dap-go = {
      enable = true;
      settings.dap_configurations = [
        {
          name = "Launch";
          type = "go";
          request = "launch";
          mode = "auto";
          program = "\${fileDirname}";
          env = { };
          args = [ ];
        }
        {
          name = "Attach to Delve (server)";
          type = "go";
          request = "attach";
          mode = "remote";
          host = "localhost";
          port = 3001;
          cwd = "\${workspaceFolder}";
          debugAdapter = "dlv-dap";
          substitutePath = [
            {
              from = "\${workspaceFolder}";
              to = "/project";
            }
            {
              from = "\${env:GOPATH}";
              to = "/go";
            }
          ];
        }
        {
          name = "Attach to Delve (drain)";
          type = "go";
          request = "attach";
          mode = "remote";
          host = "localhost";
          port = 3002;
          cwd = "\${workspaceFolder}";
          debugAdapter = "dlv-dap";
          substitutePath = [
            {
              from = "\${workspaceFolder}";
              to = "/project";
            }
            {
              from = "\${env:GOPATH}";
              to = "/go";
            }
          ];
        }
        {
          name = "Attach to Delve (launcher)";
          type = "go";
          request = "attach";
          mode = "remote";
          host = "localhost";
          port = 3004;
          cwd = "\${workspaceFolder}";
          debugAdapter = "dlv-dap";
          substitutePath = [
            {
              from = "\${workspaceFolder}";
              to = "/project";
            }
            {
              from = "\${env:GOPATH}";
              to = "/go";
            }
          ];
        }
        {
          name = "Attach to Delve (vcs-gateway)";
          type = "go";
          request = "attach";
          mode = "remote";
          host = "localhost";
          port = 3005;
          cwd = "\${workspaceFolder}";
          debugAdapter = "dlv-dap";
          substitutePath = [
            {
              from = "\${workspaceFolder}";
              to = "/project";
            }
            {
              from = "\${env:GOPATH}";
              to = "/go";
            }
          ];
        }
        {
          name = "Attach to Delve (worker)";
          type = "go";
          request = "attach";
          mode = "remote";
          host = "localhost";
          port = 3007;
          cwd = "\${workspaceFolder}";
          debugAdapter = "dlv-dap";
          substitutePath = [
            {
              from = "\${workspaceFolder}";
              to = "/project";
            }
            {
              from = "\${env:GOPATH}";
              to = "/go";
            }
          ];
        }
      ];
    };
    dap-ui = { enable = true; };
  };
}
