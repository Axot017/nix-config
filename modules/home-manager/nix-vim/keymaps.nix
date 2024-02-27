{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.keymaps = [
    ##########################
    ##  Normal              ##
    ##########################

    # NvimTree
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      options = {
        silent = true;
      };
    }
    # Window navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        silent = true;
      };
    }
    ##########################
    ##  Visual              ##
    ##########################

    # Stay in indent mode
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        silent = true;
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        silent = true;
      };
    }
  ];
}
