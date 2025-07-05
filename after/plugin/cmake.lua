vim.g.cmake_link_compile_commands = 1
vim.keymap.set("", "<leader>cg", "<cmd>:CMakeGenerate<CR>",{})
vim.keymap.set("", "<leader>cb", "<cmd>:CMakeBuild -j8<CR>",{})
vim.keymap.set("", "<leader>cq", "<cmd>:CMakeClose<CR>",{})
vim.keymap.set("", "<leader>cc", "<cmd>:CMakeClean<CR>",{})
