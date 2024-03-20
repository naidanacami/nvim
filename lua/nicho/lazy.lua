local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'nvim-tree/nvim-web-devicons',
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'mbbill/undotree',
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
    {
		'lervag/vimtex'
	},
    {
        'navarasu/onedark.nvim'
	},
	{
		'SirVer/ultisnips',
		event = { 'InsertEnter' }
	},
	{
		'vim-airline/vim-airline',
	},
	{
		'vim-airline/vim-airline-themes',
	},
	{
		'equalsraf/neovim-gui-shim'
	},
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
		require('dashboard').setup {
			theme = 'hyper',
			config = {
			week_header = {
			enable = true,
			},
			shortcut = {
				{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
				{
					icon = ' ',
					icon_hl = '@variable',
					desc = 'Files',
					group = 'Label',
					action = 'Telescope find_files',
					key = 'f',
				},
				{
					desc = ' Apps',
					group = 'DiagnosticHint',
					action = 'Telescope app',
					key = 'a',
				},
				{
					desc = ' dotfiles',
					group = 'Number',
					action = 'Telescope dotfiles',
					key = 'd',
				},
			},
			},
		}
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},
	{
		'nvim-tree/nvim-tree.lua',
	},
	{
		'nanozuki/tabby.nvim',
		event = 'VimEnter',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function() 	
			-- configs...
		end,
	}
})
