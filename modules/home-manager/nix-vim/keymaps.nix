{ pkgs, config, inputs, ... }: {
  programs.nixvim.keymaps = [
    ##########################
    ##  Normal              ##
    ##########################

    # NvimTree
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>NvimTreeFindFileToggle<CR>";
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
      action = "<cmd>BufferLineCycleNext<CR><cmd>BufferLineCloseLeft<CR>";
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
      action = "_dP";
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
  ];
}
