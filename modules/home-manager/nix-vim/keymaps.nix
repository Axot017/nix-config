{ pkgs, config, inputs, ... }: {
  programs.nixvim.keymaps = [
    ##########################
    ##  Normal              ##
    ##########################

    # DAP
    {
      mode = "n";
      key = "<leader>dh";
      action.__raw = "function() require('dapui').eval() end";
    }
    {
      mode = "n";
      key = "<leader>de";
      action.__raw = ''
        function() 
                vim.ui.input({ prompt = 'Expresion: ' }, function(input)
                  require('dapui').eval(input) 
                end)
              end'';
    }
    {
      mode = "n";
      key = "<leader>dt";
      action.__raw = "require('dapui').toggle";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action.__raw = "require('dap').continue";
    }
    {
      mode = "n";
      key = "<leader>di";
      action.__raw = "require('dap').step_into";
    }
    {
      mode = "n";
      key = "<leader>do";
      action.__raw = "require('dap').step_over";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action.__raw = "require('dap').toggle_breakpoint";
    }
    {
      mode = "n";
      key = "<F1>";
      action.__raw = "require('dapui').toggle";
    }
    {
      mode = "n";
      key = "<F2>";
      action.__raw = "require('dap').continue";
    }
    {
      mode = "n";
      key = "<F3>";
      action.__raw = "require('dap').toggle_breakpoint";
    }
    # Multiterm
    {
      mode = "n";
      key = "<leader>tt";
      action.__raw = "function() require('multiterm').bind_toggle() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>tq";
      action.__raw = "function() require('multiterm').close_active() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>tr";
      action.__raw = "function() require('multiterm').bind_remove() end";
      options = { silent = true; };
    }
    # Oil
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>Oil<CR>";
      options = { silent = true; };
    }
    # Window navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = { silent = true; };
    }
    # Resizing
    {
      mode = "n";
      key = "<S-Up>";
      action = "<cmd>resize +2<CR>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<S-Down>";
      action = "<cmd>resize -2<CR>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<S-Left>";
      action = "<cmd>vertical resize -2<CR>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<S-Right>";
      action = "<cmd>vertical resize +2<CR>";
      options = { silent = true; };
    }
    # Clipboard
    {
      mode = "n";
      key = "<C-y>";
      action = ''"+y'';
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<C-p>";
      action = ''"+p'';
      options = { silent = true; };
    }
    # Movement
    {
      mode = "n";
      key = "<ESC>";
      action = "<cmd>noh<CR>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "n";
      action = "nzz";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "N";
      action = "Nzz";
      options = { silent = true; };
    }
    # Tabs
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>x";
      action.__raw = "function() Snacks.bufdelete() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>X";
      action.__raw = "function() Snacks.bufdelete.other() end";
      options = { silent = true; };
    }
    # Neotest
    {
      mode = "n";
      key = "<leader>trr";
      action.__raw = "function() require('neotest').run.run() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>trd";
      action.__raw =
        ''function() require('neotest').run.run({strategy = "dap"}) end'';
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>trf";
      action.__raw =
        ''function() require('neotest').run.run({vim.fn.expand("%")}) end'';
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>tst";
      action.__raw = "function() require('neotest').summary.toggle() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>tot";
      action.__raw = "function() require('neotest').output_panel.toggle() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>toc";
      action.__raw = "function() require('neotest').output_panel.clear() end";
      options = { silent = true; };
    }

    # Go
    {
      mode = "n";
      key = "<leader>ge";
      action = "<cmd>GoIfErr<CR>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>ge";
      action = "<cmd>GoIfErr<CR>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>gt";
      action.__raw = ''
        function() 
          require("gopher").test.add()
          local test_file = vim.fn.expand("%:r") .. "_test.go"
          vim.cmd("edit " .. test_file)
        end
      '';
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>gj";
      action = "<cmd>GoTagAdd json<CR>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>gy";
      action = "<cmd>GoTagAdd yaml<CR>";
      options = { silent = true; };
    }

    # Snacks picker
    {
      mode = "n";
      key = "<leader>ff";
      action.__raw = "function() Snacks.picker.files() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action.__raw = "function() Snacks.picker.recent() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action.__raw = "function() Snacks.picker.grep() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>fd";
      action.__raw = "function() Snacks.picker.diagnostics() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "gi";
      action.__raw = "function() Snacks.picker.lsp_implementations() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "gd";
      action.__raw = "function() Snacks.picker.lsp_definitions() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "gr";
      action.__raw = "function() Snacks.picker.lsp_references() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action.__raw = "function() Snacks.picker.git_branches() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action.__raw = "function() Snacks.picker.git_status() end";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action.__raw = "function() Snacks.picker.git_diff() end";
      options = { silent = true; };
    }

    ##########################
    ##  Visual              ##
    ##########################

    # Stay in indent mode
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = { silent = true; };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = { silent = true; };
    }
    {
      mode = "v";
      key = "<C-y>";
      action = ''"+y'';
      options = { silent = true; };
    }
    {
      mode = "v";
      key = "<C-p>";
      action = ''"+p'';
      options = { silent = true; };
    }
    # Other
    {
      mode = "v";
      key = "p";
      action = ''"_dP"'';
      options = { silent = true; };
    }
    ##########################
    ##  Visual Block        ##
    ##########################
    {
      mode = "x";
      key = "<C-y>";
      action = ''"+y'';
      options = { silent = true; };
    }
    {
      mode = "x";
      key = "<C-p>";
      action = ''"+p'';
      options = { silent = true; };
    }
    ##########################
    ##      Terminal        ##
    ##########################
    {
      mode = "t";
      key = "<esc><esc>";
      action = "<C-\\><C-n>";
      options = { silent = true; };
    }
  ];
}
