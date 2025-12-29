return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		{
			'L3MON4D3/LuaSnip',
			version = 'v2.*',
			build = 'make install_jsregexp',
		},
	},
	lazy = false,
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()

		-- MASON
		require'mason'.setup({
			ui={
				icons={
					package_installed   = '✓',
					package_pending     = '󰠠',
					package_uninstalled = '',
				},
				check_outdated_packages_on_open = true,
				backdrop = 60,
				border = 'single',
				width = 0.8,
				height = 0.8,
			},
		})

		-- MASON LSP INSTALLATIONS
		require'mason-lspconfig'.setup({
			ensure_installed = {
			 'clangd',
			 'cssls',
			 'gopls',
			 'html',
			 'elixirls',
			 'lua_ls',
			 'pyright',
			 'rust_analyzer',
			 'tailwindcss',
			 'zls',
			 'marksman',
			},
			automatic_installation = true,
		})

		-- CMP
		local cmp = require'cmp'
		local lsp_kinds = {
			Text = '󰉿',
			Method = '󰆧',
			Function = '󰊕',
			Constructor = '',
			Field = '󰜢',
			Variable = '󰀫',
			Class = '󰠱',
			Interface = '',
			Module = '',
			Property = '󰜢',
			Unit = '󰑭',
			Value = '󰎠',
			Enum = '',
			Keyword = '󰌋',
			Snippet = '',
			Color = '󰏘',
			File = '󰈙',
			Reference = '󰈇',
			Folder = '󰉋',
			EnumMember = '',
			Constant = '󰏿',
			Struct = '󰙅',
			Event = '',
			Operator = '󰆕',
			TypeParameter = '',
		}
		-- require'luasnip.loaders.from_vscode'.lazy_load()

		cmp.setup({
			experimental = {
				ghost_text = true,
			},
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			window = {
				documentation = {
					 border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
				},
				completion = {
					 border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
				},
			},
			snippet = {
				expand = function(args)
					require'luasnip'.lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				-- { name = 'luasnip' },
				-- { name = 'buffer' },
				-- { name = 'path' },
			}),
			mapping = cmp.mapping.preset.insert({
				['<C-u>'] = cmp.mapping.scroll_docs(-4),
				['<C-d>'] = cmp.mapping.scroll_docs(4),
				['<C-j>'] = cmp.mapping(function() if cmp.visible() then cmp.select_next_item() end end),
				['<C-k>'] = cmp.mapping(function() if cmp.visible() then cmp.select_prev_item() end end),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = string.format('%s %s', lsp_kinds[vim_item.kind] or '', vim_item.kind)
					vim_item.menu = ({
						buffer = '[Buffer]',
						nvim_lsp = '[LSP]',
						luasnip = '[LuaSnip]',
						nvim_lua = '[Lua]',
						latex_symbols = '[LaTeX]',
					})[entry.source.name]
					return vim_item
				end
			},
		})
		-- CONFIGURE SERVERS
		local capabilities = require'cmp_nvim_lsp'.default_capabilities()
		vim.lsp.config('*', { capabilities = capabilities })
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = 'LSP: Open Diagnostics List'
				vim.keymap.set('n', ' q', vim.diagnostic.setloclist, opts)

				opts.desc = 'LSP: [G]oto [D]efinition'
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

				opts.desc = 'LSP: [G]oto [D]eclaration'
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

				opts.desc = 'LSP: Hover [I]nformation'
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

				opts.desc = 'LSP: [G]oto [T]ype [D]efinition'
				vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

				opts.desc = 'LSP: [G]oto [I]mplementation'
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

				opts.desc = 'LSP: Rename Definition'
				vim.keymap.set('n', ' r', vim.lsp.buf.rename, opts)

				opts.desc = 'LSP: [C]ode Action'
				vim.keymap.set('n', ' c', vim.lsp.buf.code_action, opts)

				opts.desc = 'Go To Previous Diagnostic Message'
				vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count = -1}) end, opts)

				opts.desc = 'Go To Next Diagnostic Message'
				vim.keymap.set('n', ']d', function () vim.diagnostic.jump({count = 1}) end, opts)

				opts.desc = '[O]pen [F]loating Diagnostic Message'
				vim.keymap.set('n', ' e', vim.diagnostic.open_float, opts)
			end
		})

		vim.diagnostic.config({
			signs = {
				Error = ' ',
				Warn  = ' ',
				Hint  = '󰠠 ',
				Info  = ' ',
			},
			virtual_text = true,
			underline = true,
			update_in_insert = false,
		})

		vim.lsp.config('pyright', {})
		vim.lsp.config('cssls', {})
		vim.lsp.config('clangd', {})
		vim.lsp.config('zls', {})
		vim.lsp.config('gopls', {})
		vim.lsp.config('html', {})

		vim.lsp.config('tailwindcss', {
			tailwindCSS = {
				experimental = {
					configFile = '',
				},
			},
		})

		vim.lsp.config('luals', {
			cmd = { 'lua-language-server' },
			settings = {
				Lua = {
					diagnostics = {
						globals = {'vim'},
					},
					completion = {
						callSnippet = 'Replace',
					},
					workspace = {
						library = {
							vim.api.nvim_get_runtime_file('', true),
						},
					},
					runtime = {
						version = 'LuaJIT',
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		vim.lsp.enable('luals')
		vim.lsp.enable('html')
		vim.lsp.enable('gopls')
		vim.lsp.enable('zls')
		vim.lsp.enable('pyright')
		vim.lsp.enable('cssls')
		vim.lsp.enable('clangd')
		vim.lsp.enable('tailwindcss')
	end
}
