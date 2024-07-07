return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = "VeryLazy",
  config = function()
    local actions = require('telescope.actions')
    local telescope = require('telescope')

    telescope.setup {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<CR>"] = actions.select_default,
          ["<Tab>"] = actions.move_selection_worse,
          ["<S-Tab>"] = actions.move_selection_better,
        },
        n = {
          ["<esc>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,
          ["?"] = actions.which_key,
        },
      },
    }

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap('n', '<leader>ff', telescope.find_files, opts)
    keymap('n', '<leader>fg', telescope.live_grep, opts)
    keymap('n', '<leader>fb', telescope.buffers, opts)

    keymap('n', 'gi', telescope.lsp_implementations, opts)
    keymap('n', 'gr', telescope.lsp_references, opts)
    keymap('n', '<leader>fd', telescope.lsp_definitions, opts)
  end,

}
