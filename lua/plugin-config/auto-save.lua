require('auto-save').setup({
  execution_message = {
		message = function() -- message to print on save
			return ("")
		end,
	},
})
