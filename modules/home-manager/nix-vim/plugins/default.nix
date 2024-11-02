{ pkgs, config, inputs, helpers, ... }: {
  imports = [
    ./web-devicons.nix
    ./avante.nix
    ./neogit.nix
    ./autoclose.nix
    ./bufferline.nix
    ./neorg.nix
    ./dap.nix
    ./hardtime.nix
    ./treesitter.nix
    ./telescope.nix
    ./copilot.nix
    ./lsp.nix
    ./cmp.nix
    ./comment-nvim.nix
    ./project-nvim.nix
    ./luasnip.nix
    ./lualine.nix
    ./none-ls.nix
    ./mini.nix
    ./tmux-navigator.nix
    ./dressing.nix
  ];
}
