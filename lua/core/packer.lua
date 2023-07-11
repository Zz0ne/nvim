local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("lewis6991/gitsigns.nvim")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("akinsho/toggleterm.nvim")
	use("xiyaowong/transparent.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Color schemes
	use("olimorris/onedarkpro.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("folke/tokyonight.nvim")

	-- Auto Complete plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("windwp/nvim-autopairs")

	--snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
	use("lewis6991/hover.nvim")
	use("yamatsum/nvim-cursorline")
	use("mfussenegger/nvim-dap")
	use("jay-babu/mason-nvim-dap.nvim")
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
	})
	use("theHamsta/nvim-dap-virtual-text")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
