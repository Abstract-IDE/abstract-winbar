local M = {}

function M.get_filetype_icon()
	local _devicons, devicons = pcall(require, "nvim-web-devicons")
	if not _devicons then
		return false
	end
	local file_name = vim.fn.expand("%:t")
	local ext = vim.fn.expand("%:e")
	local icon, icon_color = devicons.get_icon_color(file_name, ext, { default = true })

	return {
		icon = icon,
		icon_color = icon_color,
	}
end

return M
