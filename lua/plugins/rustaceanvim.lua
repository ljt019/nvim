return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false, -- plugin is already lazy
		ft = { "rust" },
		init = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							check = {
								command = "clippy",
							},
							cargo = {
								allFeatures = true,
							},
						},
					},
				},
			}

			-- Rust keymaps (only active in rust files)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "rust",
				callback = function()
					local opts = { buffer = true }
					vim.keymap.set("n", "<leader>rr", "<cmd>RustLsp runnables<cr>", vim.tbl_extend("force", opts, { desc = "[R]ust [R]unnables" }))
					vim.keymap.set("n", "<leader>rl", "<cmd>RustLsp! runnables<cr>", vim.tbl_extend("force", opts, { desc = "[R]ust [L]ast runnable" }))
					vim.keymap.set("n", "<leader>rt", "<cmd>RustLsp testables<cr>", vim.tbl_extend("force", opts, { desc = "[R]ust [T]estables" }))
					vim.keymap.set("n", "<leader>re", "<cmd>RustLsp expandMacro<cr>", vim.tbl_extend("force", opts, { desc = "[R]ust [E]xpand macro" }))
					vim.keymap.set("n", "<leader>rc", "<cmd>RustLsp openCargo<cr>", vim.tbl_extend("force", opts, { desc = "[R]ust open [C]argo.toml" }))
				end,
			})
		end,
	},
}
