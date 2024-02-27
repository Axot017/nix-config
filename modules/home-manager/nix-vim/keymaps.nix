{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.keymaps = [
    {
      key = "<C-n>";
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      options = {
        silent = true;
      };
    }
# Window navigation
    {
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        silent = true;
      };
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        silent = true;
      };
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        silent = true;
      };
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        silent = true;
      };
    }
  ];
}
