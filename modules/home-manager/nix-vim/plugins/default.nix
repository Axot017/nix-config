{ pkgs, config, inputs, helpers, ... }: {
  imports = [
    ./autoclose.nix
    ./avante.nix
    ./blink-cmp.nix
    ./bufferline.nix
    ./comment-nvim.nix
    ./copilot.nix
    ./dap.nix
    ./dressing.nix
    ./go.nix
    ./lsp.nix
    ./lualine.nix
    ./luasnip.nix
    ./mini.nix
    ./multiterm.nix
    ./neogit.nix
    ./neorg.nix
    ./neotest.nix
    ./none-ls.nix
    ./oil.nix
    ./project-nvim.nix
    ./telescope.nix
    ./tmux-navigator.nix
    ./treesitter.nix
    ./web-devicons.nix
  ];
}
