return {
	"folke/todo-comments.nvim",
	lazy = false,
	priority = 1000,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require"todo-comments".setup({
			keywords = {
				FIX ={
					icon = " ",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "REFACTOR" },
					signs = false,
				},
				TODO = { icon = " ", color = "info" , alt = {"PERSONAL", "UPDATE"} },
				HACK = { icon = " ", color = "warning", alt = { "DONT SKIP" } },
				WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO", "READ", "COLORS", "Custom" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				FORGETNOT = { icon = " ", color = "hint" },
			},
			highlight = {
					multiline = true,
					multiline_pattern = "^.",
					multiline_context = 10,
					before = "",
					keyword = "bg",
					after = "fg",
					pattern = {
							[[.*<(KEYWORDS)\s*:]], -- default pattern
							[[.*<(KEYWORDS)\s*]], -- default pattern
							[[<!--\s*(KEYWORDS)\s*:.*-->]], -- HTML comments with colon
							[[<!--\s*(KEYWORDS)\s*.*-->]], -- HTML comments without colon
					},
					comments_only = false, -- highlighting outside of comments
			},
			search = {
				command = "rg",
				args = {
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
				},
				pattern = [[\b(KEYWORDS)\b]],
			},
		})
		vim.keymap.set("n", "]t", require("todo-comments").jump_next, { desc = "Next todo comment" })
		vim.keymap.set("n", "[t", require("todo-comments").jump_prev, { desc = "Previous todo comment" })
	end
}
