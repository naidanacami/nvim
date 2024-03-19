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
    -- {
	-- 	'nvim-treesitter/nvim-treesitter',
	-- 	build = ":TSUpdate",
	-- 	event = { "BufReadPost", "BufNewFile" },
	-- 	dependencies = {
	-- 		{
	-- 			"nvim-treesitter/nvim-treesitter-textobjects",
	-- 			init = function()
	-- 				-- disable rtp plugin, as we only need its queries for mini.ai
	-- 				-- In case other textobject modules are enabled, we will load them
	-- 				-- once nvim-treesitter is loaded
	-- 				require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
	-- 				load_textobjects = true
	-- 			end,
	-- 		},
	-- 	},
	-- 	cmd = { "TSUpdateSync" },
	-- },
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
})
