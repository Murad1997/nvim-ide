-- vim.keymap.set("n", "<leader>ft","<cmd>FloatermToggle<CR>", {} )
vim.g.floatterm_position = 'right'
vim.g.floaterm_wintype = "split"
vim.g.floaterm_height = 0.2
vim.g.floaterm_width = 0.4
vim.g.floaterm_autoclose = 2
-- vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>FloatermToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ft', '<cmd>FloatermToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<leader>ft', '<C-\\><C-n><cmd>FloatermToggle<CR>', { noremap = true, silent = true })
