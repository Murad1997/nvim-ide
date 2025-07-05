vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)



vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")



vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")


-- difference between Ctrl-c and escape
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


vim.keymap.set("n", "[q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "]q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "[l", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "]l", "<cmd>lprev<CR>zz")


vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})



vim.keymap.set("n", "<leader>s",":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {silent = true})
-- Vertical and horizontal splits
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", {silent=true})
vim.keymap.set("n", "<leader>h", ":split<CR>", {silent = true})
-- Navigating to multiple splits
vim.keymap.set("n", "<C-h>", "<C-w>h", {silent = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {silent = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {silent = true})
-- Neovim splits resizing
vim.keymap.set("n", "<M-h>", ":vertical resize -2<CR>", {silent = true})
vim.keymap.set("n", "<M-j>", ":resize -2<CR>", {silent = true})
vim.keymap.set("n", "<M-k>", ":resize +2<CR>", {silent = true})
vim.keymap.set("n", "<M-l>", ":vertical resize +2<CR>", {silent = true})
vim.keymap.set("n", "<leader>=", "<C-w>=", {silent = true})
-- Ctrl-h with tmux
-- vim.api.nvim_set_keymap('n', '<BS>', '<C-h>', { silent = true })
-- vim.api.nvim_set_keymap('t', '<BS>', '<C-h>', { silent = true })
vim.api.nvim_set_keymap("n", "<leader>psc", ':lua require("telescope.builtin").grep_string({search = vim.fn.expand("<cword>")})<CR>', {noremap = true, silent = true})
vim.keymap.set("n", "<leader>gl", ":Git log --graph <CR>", {silent = true})
vim.keymap.set("n", "<leader>psl", ":Telescope live_grep_args<CR>", {silent = true})
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- Codeium Enable/Disable
vim.keymap.set('n', '<leader>ce', function()
    vim.g.codeium_enabled = true
    vim.notify("Codeium enabled", vim.log.levels.INFO)
end, { desc = 'Enable Codeium' })

vim.keymap.set('n', '<leader>cd', function()
    vim.g.codeium_enabled = false
    vim.notify("Codeium disabled", vim.log.levels.INFO)
end, { desc = 'Disable Codeium' })

-- setting up the local command
-- vim.keymap.set('n', '<leader>rx', function()
--     local file_dir = vim.fn.expand('%:p:h')
--     local cur_dir = vim.fn.getcwd()
--     vim.cmd('cd ' .. file_dir)
--
--     vim.ui.input({prompt = 'Command: '}, function(input)
--         if input then
--             vim.cmd('botright 10split')
--             vim.cmd('terminal ' .. input)
--         end
--     end)
--     vim.cmd('cd ' .. cur_dir)
-- end)

-- Initialize a variable to store the command
vim.g.stored_command_local = nil
-- Function to run the stored command
vim.keymap.set('n', '<leader>rrl', function()
    local file_dir = vim.fn.expand('%:p:h')
    local cur_dir = vim.fn.getcwd()
    local current_win_id = vim.api.nvim_get_current_win()
    local function close_existing_terminal()
        for _, win_id in ipairs(vim.api.nvim_list_wins()) do
            local buf_id = vim.api.nvim_win_get_buf(win_id)
            local buf_type = vim.fn.getbufvar(buf_id, '&buftype')
            if buf_type == 'terminal' then
                vim.api.nvim_win_close(win_id, true)
            end
        end
    end
    
    if not vim.g.stored_command_local then
        vim.ui.input({prompt = 'Set command: '}, function(input)
            if input then
                vim.g.stored_command_local = input
                vim.cmd('cd ' .. file_dir)
                vim.cmd('botright 80vsplit')
                vim.cmd('terminal ' .. vim.g.stored_command_local)
                vim.cmd("normal G")
                vim.cmd('cd ' .. cur_dir)
                vim.api.nvim_set_current_win(current_win_id)
            end
        end)
    else
        close_existing_terminal()
        vim.cmd('cd ' .. file_dir)
        vim.cmd('botright 80vsplit')
        vim.cmd('terminal ' .. vim.g.stored_command_local)
        vim.cmd("normal G")
        vim.cmd('cd ' .. cur_dir)
        vim.api.nvim_set_current_win(current_win_id)
    end
end)

-- Function to change the stored command
vim.keymap.set('n', '<leader>rcl', function()
    vim.ui.input({prompt = 'Update command: '}, function(input)
        if input then
            vim.g.stored_command_local = input
            print("Command updated to: " .. input)
        end
    end)
end)

