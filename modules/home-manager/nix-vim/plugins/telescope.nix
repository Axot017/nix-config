{ pkgs, config, inputs, ... }: 
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        desc = "Find files";
      };
      "<leader>fg" = {
        action = "live_grep";
        desc = "Live grep";
      };
      "<leader>fb" = {
        action = "buffers";
        desc = "Find buffer";
      };
      "gi" = {
        action = "lsp_implementations";
        desc = "Go to implementation";
      };
      "gr" = {
        action = "lsp_references";
        desc = "Go to reference";
      };
    };
  };
}
