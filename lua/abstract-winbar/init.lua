local navic = require("nvim-navic")
local configs = require("abstract-winbar.config")
local funcs = require("abstract-winbar.funcs")

local M = {}

local function winbar()
	local file = ""
	local winbar_data = ""
	local filename = vim.fn.expand("%:t")

	if filename ~= "" or filename ~= nil then
		local dev_icon = funcs.get_filetype_icon()

		if dev_icon then
			vim.api.nvim_set_hl(0, "NavicIconsFileIcon", { fg = dev_icon.icon_color, bold = true })

			local icon = dev_icon.icon
			if icon == "" or icon == nil then
				icon = " "
			end
			-- let the colorscheme plugin handle the highlight for NavicFileIcon icon
			file = " "
				.. "%#"
				.. "NavicIconsFileIcon"
				.. "#"
				.. icon
				.. "%*"
				.. " "
				.. "%#NavicIconsFile#"
				.. filename
				.. "%*"
		end

		-- show modified flag/icon if file is being modified and not saved
		if vim.bo.modified then
			file = file .. "%#NavicIconsFile#" .. "" .. "%*"
		end
		winbar_data = file

		if navic.is_available() then
			local status_getlocation, navic_location = pcall(navic.get_location, {})
			if not status_getlocation then
				goto continue_winbar
			end
			if navic_location == "error" then
				goto continue_winbar
			end
			if not (navic_location == "" or navic_location == nil) then
				winbar_data = " " .. navic_location
			else
				goto continue_winbar
			end
			winbar_data = file .. winbar_data
		end
	end

	::continue_winbar::
	local status_setwinbar, _ = pcall(vim.api.nvim_set_option_value, "winbar", winbar_data, { scope = "local" })
	if not status_setwinbar then
		return
	end
end

function M.setup(opts)
	-- overide default options with user-defined options
	if opts ~= nil then
		configs = vim.tbl_extend("force", configs, opts)
	end

	vim.api.nvim_create_augroup("AbstractWinbarAutoGroup", { clear = true })
	vim.api.nvim_create_autocmd(
		{ "BufFilePost", "BufWinEnter", "BufWritePost", "CursorHold", "CursorMoved", "InsertEnter", "TabClosed" },
		{
			desc = "don't load winbar for certain filetypes and buffers",
			pattern = "*",
			group = "AbstractWinbarAutoGroup",
			callback = function()
				-- disable winbar in these filetypes
				if vim.tbl_contains(configs.exclude_filetypes, vim.bo.filetype) then
					return
				end
				winbar()
			end,
		}
	)
end

return M
