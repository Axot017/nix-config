{ pkgs, config, inputs, ... }: {
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
      "<leader>fd" = {
        action = "diagnostics";
        desc = "Show diagnostics";
      };
      "gi" = {
        action = "lsp_implementations";
        desc = "Go to implementation";
      };
      "gr" = {
        action = "lsp_references";
        desc = "Go to reference";
      };
      # "<TAB>" = {
      #   action = "move_selection_worse";
      #   desc = "Move selection worse";
      # };
      # "<S-TAB>" = {
      #   action = "move_selection_better";
      #   desc = "Move selection better";
      # };
    };
  };
}
