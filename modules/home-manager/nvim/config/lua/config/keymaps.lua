-- DAP
vim.keymap.set('n', '<leader>dh', function() require('dapui').eval() end, { silent = true, desc = 'DAP eval hover' })
vim.keymap.set('n', '<leader>de', function()
  vim.ui.input({ prompt = 'Expression: ' }, function(input)
    require('dapui').eval(input)
  end)
end, { silent = true, desc = 'DAP eval expression' })
vim.keymap.set('n', '<leader>dt', require('dapui').toggle, { silent = true, desc = 'DAP UI toggle' })
vim.keymap.set('n', '<leader>dc', require('dap').continue, { silent = true, desc = 'DAP continue' })
vim.keymap.set('n', '<leader>di', require('dap').step_into, { silent = true, desc = 'DAP step into' })
vim.keymap.set('n', '<leader>do', require('dap').step_over, { silent = true, desc = 'DAP step over' })
vim.keymap.set('n', '<leader>dt', require('dap').toggle_breakpoint, { silent = true, desc = 'DAP toggle breakpoint' })
vim.keymap.set('n', '<F1>', require('dapui').toggle, { silent = true, desc = 'DAP UI toggle' })
vim.keymap.set('n', '<F2>', require('dap').continue, { silent = true, desc = 'DAP continue' })
vim.keymap.set('n', '<F3>', require('dap').toggle_breakpoint, { silent = true, desc = 'DAP toggle breakpoint' })

-- Oil
vim.keymap.set('n', '<C-n>', '<cmd>Oil<CR>', { silent = true, desc = 'Open Oil' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true, desc = 'Go to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true, desc = 'Go to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true, desc = 'Go to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true, desc = 'Go to right window' })

-- Window resizing
vim.keymap.set('n', '<S-Up>', '<cmd>resize +2<CR>', { silent = true, desc = 'Increase window height' })
vim.keymap.set('n', '<S-Down>', '<cmd>resize -2<CR>', { silent = true, desc = 'Decrease window height' })
vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -2<CR>', { silent = true, desc = 'Decrease window width' })
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +2<CR>', { silent = true, desc = 'Increase window width' })

-- Clipboard
vim.keymap.set({ 'n', 'v', 'x' }, '<C-y>', '"+y', { silent = true, desc = 'Yank to system clipboard' })
vim.keymap.set({ 'n', 'v', 'x' }, '<C-p>', '"+p', { silent = true, desc = 'Paste from system clipboard' })

-- Movement
vim.keymap.set('n', '<ESC>', '<cmd>noh<CR>', { silent = true, desc = 'Clear search highlight' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true, desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true, desc = 'Scroll up and center' })
vim.keymap.set('n', 'n', 'nzz', { silent = true, desc = 'Next search result and center' })
vim.keymap.set('n', 'N', 'Nzz', { silent = true, desc = 'Previous search result and center' })

-- Tabs/Buffers
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { silent = true, desc = 'Previous buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { silent = true, desc = 'Next buffer' })
vim.keymap.set('n', '<leader>x', function() Snacks.bufdelete() end, { silent = true, desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>X', function() Snacks.bufdelete.other() end,
  { silent = true, desc = 'Delete other buffers' })

-- Neotest
vim.keymap.set('n', '<leader>trr', function() require('neotest').run.run() end,
  { silent = true, desc = 'Run nearest test' })
vim.keymap.set('n', '<leader>trd', function() require('neotest').run.run({ strategy = "dap" }) end,
  { silent = true, desc = 'Debug nearest test' })
vim.keymap.set('n', '<leader>trf', function() require('neotest').run.run({ vim.fn.expand("%") }) end,
  { silent = true, desc = 'Run file tests' })
vim.keymap.set('n', '<leader>tst', function() require('neotest').summary.toggle() end,
  { silent = true, desc = 'Toggle test summary' })
vim.keymap.set('n', '<leader>tot', function() require('neotest').output_panel.toggle() end,
  { silent = true, desc = 'Toggle test output' })
vim.keymap.set('n', '<leader>toc', function() require('neotest').output_panel.clear() end,
  { silent = true, desc = 'Clear test output' })

-- Go
vim.keymap.set('n', '<leader>ge', '<cmd>GoIfErr<CR>', { silent = true, desc = 'Add Go if err' })
vim.keymap.set('n', '<leader>gt', function()
  require("gopher").test.add()
  local test_file = vim.fn.expand("%:r") .. "_test.go"
  vim.cmd("edit " .. test_file)
end, { silent = true, desc = 'Add Go test' })
vim.keymap.set('n', '<leader>gj', '<cmd>GoTagAdd json<CR>', { silent = true, desc = 'Add JSON tags' })
vim.keymap.set('n', '<leader>gy', '<cmd>GoTagAdd yaml<CR>', { silent = true, desc = 'Add YAML tags' })

-- Snacks picker
vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { silent = true, desc = 'Find files' })
vim.keymap.set('n', '<leader>fr', function() Snacks.picker.recent() end, { silent = true, desc = 'Recent files' })
vim.keymap.set('n', '<leader>fg', function() Snacks.picker.grep() end, { silent = true, desc = 'Live grep' })
vim.keymap.set('n', '<leader>fd', function() Snacks.picker.diagnostics() end, { silent = true, desc = 'Diagnostics' })
vim.keymap.set('n', 'gi', function() Snacks.picker.lsp_implementations() end,
  { silent = true, desc = 'Go to implementations' })
vim.keymap.set('n', 'gd', function() Snacks.picker.lsp_definitions() end, { silent = true, desc = 'Go to definitions' })
vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end, { silent = true, desc = 'Go to references' })
vim.keymap.set('n', '<leader>gb', function() Snacks.picker.git_branches() end, { silent = true, desc = 'Git branches' })
vim.keymap.set('n', '<leader>gs', function() Snacks.picker.git_status() end, { silent = true, desc = 'Git status' })
vim.keymap.set('n', '<leader>gd', function() Snacks.picker.git_diff() end, { silent = true, desc = 'Git diff' })

-- LSP
vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, { silent = true, desc = 'LSP rename' })
vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, { silent = true, desc = 'LSP code action' })

-- Terminal mode
vim.keymap.set('t', '<esc><esc>', '<C-\\><C-n>', { silent = true, desc = 'Exit terminal mode' })

-- Kulala
vim.keymap.set('n', '<leader>hs', function() require('kulala').run() end, { silent = true, desc = 'Run Kulala' })
vim.keymap.set('n', '<leader>ha', function() require('kulala').run_all() end, { silent = true, desc = 'Run all Kulala' })
vim.keymap.set('n', '<leader>hb', function() require('kulala').scratch() end, { silent = true, desc = 'Kulala scratch' })

-- Multiterm
vim.keymap.set('n', '<leader>tt', function() require('multiterm').bind_toggle() end,
  { silent = true, desc = 'Terminal toggle' })
vim.keymap.set('n', '<leader>tq', function() require('multiterm').close_active() end,
  { silent = true, desc = 'Terminal close' })
vim.keymap.set('n', '<leader>tr', function() require('multiterm').bind_remove() end,
  { silent = true, desc = 'Terminal remove' })
