vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "lifepillar/vim-gruvbox8" },
	{ "nvim-lualine/lualine.nvim", dependecies = "nvim-tree/nvim-web-devicons" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = "nvim-lua/plenary.nvim" },
	{ "nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "templ", "html", "javascript", "typescript", "json", "yaml", "dockerfile" },
			sync_install = false,
			auto_install = false,
			highlight = { 
				enable = true,
				additional_vim_regex_highlighting = false
			},
			indent = { enable = true }
		})
	end
	},
	{ "rstacruz/vim-closer" }
})

vim.cmd("set background=dark")
vim.cmd("colorscheme gruvbox8_hard")
require("keymaps")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

require("lualine").setup({ options = { theme = "gruvbox_dark" } })
