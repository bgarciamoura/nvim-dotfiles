local Plugin = { "kevinhwang91/nvim-ufo" }

local opts = { noremap = true, silent = true }

function Plugin.config()
	require("ufo").setup({
		open_fold_hl_timeout = 100,
		close_fold_kinds = { "comment", "function", "if", "else", "for", "while", "try", "except", "class" },
		preview = {
			win_config = {
				border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				winblend = 0,
			},
			mappings = {
				scrollU = "<C-u>",
				scrollD = "<C-d>",
				jumpTop = "[",
				jumpBottom = "]",
				toggle = "p",
			},
		},

		fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local totalLines = vim.api.nvim_buf_line_count(0)
			local foldedLines = endLnum - lnum
			local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
			suffix = (" "):rep(rAlignAppndx) .. suffix
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end,
	})
	vim.o.foldcolumn = "1"
	vim.o.foldlevel = 99
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true
	vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

	vim.keymap.set("n", "zR", require("ufo").openAllFolds, opts)
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds, opts)
	vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, opts)
	vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, opts)
end

return Plugin

