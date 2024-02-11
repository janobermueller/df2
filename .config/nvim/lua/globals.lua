local globals = {
	clipboard = 0,
	loaded_python3_provider = 0,
	loaded_ruby_provider = 0,
	loaded_node_provider = 0,
	loaded_perl_provider = 0,
}

for k, v in pairs(globals) do
	vim.g[k] = v
end
