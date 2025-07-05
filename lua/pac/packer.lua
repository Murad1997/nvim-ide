vim.cmd [[packadd packer.vim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

use {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	requires = {{'nvim-lua/plenary.nvim'},
    {"nvim-telescope/telescope-live-grep-args.nvim"},
},
config = function()
local telescope = require("telescope")
telescope.setup({

})
telescope.load_extension("live_grep_args")
end
}
use({
	'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine')
	end

})

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

use('nvim-treesitter/playground')
use('theprimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')

use({'neovim/nvim-lspconfig'})
use({'hrsh7th/nvim-cmp'})
use({'hrsh7th/cmp-nvim-lsp'})
use({'jose-elias-alvarez/null-ls.nvim'})
use({
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  }
})

use ({'cdelledonne/vim-cmake'})

use ({'voldikss/vim-floaterm'})
use ({
  'jghauser/fold-cycle.nvim',
  config = function()
    require('fold-cycle').setup()
  end
})
-- Remove the `use` here if you're using folke/lazy.nvim.
use({
  'Exafunction/windsurf.vim',
  config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
})
use( {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
})
use ({
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
})

use (
{
'nvim-treesitter/nvim-treesitter-context',
config = function()
    require("treesitter-context").setup()
end

})

end)
