{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      default_file_explorer = true;
      columns = [ "icon" ];
      skip_confirm_for_simple_edits = true;
      lsp_file_methods = { autosave_changes = true; };
    };
  };
}
