vim.lsp.enable('pyright')

vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_text = true,
})

vim.cmd('colorscheme koehler')

vim.opt.splitright = true
