require("neoai").setup({
	open_api_key_env = "OPEN_AI_KEY",
	ui = {
		output_popup_text = "",
		width = 100,
	},
	shortcuts = {
		{
			name = "textify",
			key = "<leader>E",
			desc = "fix text with AI",
			use_context = true,
			prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors. In addition, make it suitable for my notes and use bullet points.
            ]],
			modes = { "v" },
			strip_function = nil,
		},
	},
})
