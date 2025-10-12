return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local cmp = require'cmp'
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end
			},
			sources = {
				{ name = 'nvim_lsp' },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			})
		})
		local capabilities = require'cmp_nvim_lsp'.default_capabilities()
		local servers = {
			'pyright',
		}
		for _, server in ipairs(servers) do
			vim.lsp.config(server, {capabilities=capabilities})
			vim.lsp.enable(server)
		end
		vim.lsp.config('lua_ls', {
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
			capabilities=capabilities,
		})
		vim.lsp.enable('lua_ls')
	end
}
-- local cmp = require'cmp'
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			vim.snippet.expand(args.body)'luasnip'.lsp_expand(args.body)
-- 		end,
-- 	},
-- 	window = {
-- 		completion = cmp.config.window.bordered(),
-- 		documentation = cmp.config.window.bordered(),
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		['<C-b>'] = cmp.mapping.scroll_docs(-4),
-- 		['<C-f>'] = cmp.mapping.scroll_docs(4),
-- 		['<C-Space>'] = cmp.mapping.complete(),
-- 		['<C-e>'] = cmp.mapping.abort(),
-- 		['<CR>'] = cmp.mapping.confirm({ select = true }),
-- 	}),
-- 	sources = cmp.config.sources({
-- 		{ name = 'nvim_lsp' },
-- 		{ name = 'luasnip' },
-- 	}, {
-- 		{ name = 'buffer' },
-- 	})
-- })
--
-- end
-- vim.lsp.config('lua_ls',{
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		Lua = {
-- 			diagnositcs = {
-- 				globals = {'vim'}
-- 			},
-- 			workspace = {
-- 				library = vim.api.nvim_get_runtime_file('', true),
-- 			},
-- 			telemetry = {
-- 				enable = false,
-- 			}
-- 		}
-- 	}
-- })
-- vim.lsp.config('pyright', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
-- vim.lsp.config('cssls', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
-- vim.lsp.config('gopls', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
-- vim.lsp.config('rust_analyzer', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
-- vim.lsp.config('jdtls', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
-- vim.lsp.config('bashls', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
-- vim.lsp.config('html', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
-- -- require'lspconfig'.tsserver.setup({
-- -- 	on_attach = on_attach,
-- -- 	capabilities = capabilities,
-- -- })
-- -- require'lspconfig'.tailwindcss.setup({
-- -- 	on_attach = on_attach,
-- -- 	capabilities = capabilities,
-- -- })
-- im.lsp.config('clangd', {
--  on_attach = on_attach,
--  capabilities = capabilities,
-- )
