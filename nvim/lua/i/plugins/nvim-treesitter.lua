return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
		local configs = require("nvim-treesitter")

	      	configs.setup({
		ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "rust", "go", "cpp", "javascript", "html", "elixir", "heex", "eex", "markdown", "markdown_inline" },
		sync_install = false,
		highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" }
    },
		indent = { enable = true },
    incremental_selection = { enable = true }
	})
	end
}
