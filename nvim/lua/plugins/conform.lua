return {
	"stevearc/conform.nvim",
	opts = {
	  formatters_by_ft = {
		html = { "prettier" },
		css = { "prettier" },
		c = { nil },
	  },
	  format_on_save = { timeout_ms = 500, lsp_fallback = true },
	},
}
