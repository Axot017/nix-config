{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find files";
      };
      "<leader>fg" = {
        action = "live_grep";
        options.desc = "Live grep";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Find buffer";
      };
      "<leader>fd" = {
        action = "diagnostics";
        options.desc = "Show diagnostics";
      };
      "gi" = {
        action = "lsp_implementations";
        options.desc = "Go to implementation";
      };
      "gd" = {
        action = "lsp_definitions";
        options.desc = "Go to definitions";
      };
      "gr" = {
        action = "lsp_references";
        options.desc = "Go to reference";
      };
    };
  };
}
