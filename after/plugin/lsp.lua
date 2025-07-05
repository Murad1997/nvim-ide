-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', '<leader>vws', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', '<leader>vd', '<cmd>lua vim.diagonostic.open_float()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format {async = true}
    end, opts)
    --if not client:supports_method('textDocument/willSaveWaitUntil')
   --     and client:supports_method('textDocument/formatting') then
    --    vim.api.nvim_create_autocmd('BufWritePre', {
   --         group = vim.api.nvim_create_augroup('my.lsp', {clear = false}),
    --        buffer = event.bug,
   --         callback = function()
    --            vim.lsp.buf.format({bufnr = event.buf, id = client.id, timeout_ms = 1000})
   --         end,
    --    })
   -- end

end,
})


-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('lspconfig').gleam.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').cmake.setup({})
require('lspconfig').clangd.setup({
-- cmd = {
--     "/opt/clangd_18.1.3/bin/clangd",
--     "--background-index",
--     "--clang-tidy",
--     "--header-insertion=never",
--     "--compile-commands-dir=" .. vim.fn.getcwd(),
--     "--query-driver=/usr/local/cuda-12.5/bin/nvcc",
--     "--enable-config",
--     "--pch-storage=memory",
--     "--log=verbose"  -- To help debug any remaining issues
--   },
--   filetypes = {"cuda", "c", "cpp", "objc", "objcpp"},
--   root_dir = function()
--     return vim.fn.getcwd()
--   end,
  -- init_options = {
  --   fallbackFlags = {
  --     "-xcuda",
  --     "--cuda-gpu-arch=sm_61",
  --     "-std=c++20",
  --     "-I/usr/local/cuda-12.5/include"
  --   }
  -- }
})
vim.cmd([[
  autocmd BufRead,BufNewFile *.cu set filetype=cuda
  autocmd BufRead,BufNewFile *.cuh set filetype=cuda
]])

require('lspconfig').pyright.setup({})
require('lspconfig').bashls.setup({})
require('lspconfig').ruff.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
    end,
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
 mapping = cmp.mapping.preset.insert({})
})




