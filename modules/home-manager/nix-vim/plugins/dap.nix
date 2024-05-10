{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.dap = {
    enable = true;
    adapters = {
      executables = {
        lldb = {
          command =
            "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
          args = [ "--port" "17000" ];
        };
      };
    };
    configurations = {
      rust = [
        {
          name = "Launch - default";
          type = "lldb";
          request = "launch";
          cwd = "\${workspaceFolder}";
          program.__raw = ''
            function()
              local cwd = vim.fn.getcwd()
              local target = vim.fn.split(cwd, '/')
              local len = #target
              local last = target[len]

              return vim.fn.getcwd() .. '/target/debug/' .. last
            end
          '';
        }
        {
          name = "Launch - select";
          type = "lldb";
          request = "launch";
          cwd = "\${workspaceFolder}";
          program.__raw = ''
            function()
              local possible_files  = vim.split(vim.fn.glob(vim.fn.getcwd() .. '/target/debug/*'), '\n', {trimempty=true})

              local files = {}
              for _, file in ipairs(possible_files) do
                has_any_extension = string.match(file, '%.')
                if vim.fn.isdirectory(file) == 0 and not has_any_extension then
                  table.insert(files, file)
                end
              end

              local choice = vim.fn.inputlist(files)
              return vim.fn.getcwd() .. '/target/debug/' .. choice
            end
          '';
        }
        {
          name = "Launch - select raw";
          type = "lldb";
          request = "launch";
          cwd = "\${workspaceFolder}";
          program.__raw = ''
            function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            end
          '';
        }
        {
          name = "Attach";
          type = "lldb";
          request = "attach";
          cwd = "\${workspaceFolder}";
          pid.__raw = ''
            function()
              local cwd = vim.fn.getcwd()
              local target = vim.fn.split(cwd, '/')
              local len = #target
              local last = target[len]

              return require('dap.utils').pick_process({ filter = last })
            end
          '';
          program.__raw = ''
            function()
              local cwd = vim.fn.getcwd()
              local target = vim.fn.split(cwd, '/')
              local len = #target
              local last = target[len]

              return vim.fn.getcwd() .. '/target/debug/' .. last
            end
          '';
        }
        {
          name = "Attach - wait for";
          type = "lldb";
          request = "attach";
          cwd = "\${workspaceFolder}";
          waitFor = true;
          pid.__raw = ''
            function()
              local cwd = vim.fn.getcwd()
              local target = vim.fn.split(cwd, '/')
              local len = #target
              local last = target[len]

              return require('dap.utils').pick_process({ filter = last })
            end
          '';
          program.__raw = ''
            function()
              local cwd = vim.fn.getcwd()
              local target = vim.fn.split(cwd, '/')
              local len = #target
              local last = target[len]

              return vim.fn.getcwd() .. '/target/debug/' .. last
            end
          '';
        }
      ];
    };
    extensions = {
      dap-ui = { enable = true; };
      dap-virtual-text = { enable = true; };
    };
  };
}
