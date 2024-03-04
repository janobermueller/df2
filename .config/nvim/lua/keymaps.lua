local keymaps = {
	{ "n", "<leader>pv", vim.cmd.Ex },

	{ "n", "<C-h>",      "<C-w>h" },
	{ "n", "<C-j>",      "<C-w>j" },
	{ "n", "<C-k>",      "<C-w>k" },
	{ "n", "<C-l>",      "<C-w>l" },

	{ "n", "<C-d>",      "<C-d>zz" },
	{ "n", "<C-u>",      "<C-u>zz" },
	{ "n", "n",          "nzz" },
	{ "n", "N",          "Nzz" },

	{ "v", "J",          ":m '>+1<CR>gv=gv" },
	{ "v", "K",          ":m '<-2<CR>gv=gv" },
	{ "n", "J",          "mzJ`z" },

	{ "x", "<leader>p",  "\"_dP" },
	{ "n", "<leader>y",  "\"+y" },
	{ "v", "<leader>y",  "\"+y" },
	{ "n", "<leader>Y",  "\"+Y" },
	{ "n", "<leader>d",  "\"_d" },
	{ "v", "<leader>d",  "\"_d" },
	{ "n", "<leader>D",  "\"_D" },

	{ "n", "<leader>dp", vim.diagnostic.goto_prev,  { desc = "Go to previous [D]iagnostic message" } },
	{ "n", "<leader>dn", vim.diagnostic.goto_next,  { desc = "Go to next [D]iagnostic message" } },
	{ "n", "<leader>e",  vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" } },
	{ "n", "<leader>q",  vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" } },
}

for _, v in pairs(keymaps) do
	vim.keymap.set(v[1], v[2], v[3], { noremap = true, silent = true })
end
