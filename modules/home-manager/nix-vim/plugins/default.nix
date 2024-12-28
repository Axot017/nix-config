{ pkgs, config, inputs, helpers, ... }: {
  imports = [
    ./autoclose.nix
    ./avante.nix
    ./bufferline.nix
    ./cmp.nix
    ./comment-nvim.nix
    ./copilot.nix
    ./dap.nix
    ./dressing.nix
    ./hardtime.nix
    ./lsp.nix
    ./lualine.nix
    ./luasnip.nix
    ./mini.nix
    ./neogit.nix
    ./neorg.nix
    ./none-ls.nix
    ./project-nvim.nix
    ./telescope.nix
    ./tmux-navigator.nix
    ./treesitter.nix
    ./web-devicons.nix
  ];
}
