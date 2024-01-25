<br/>
<p align="center">
  <h3 align="center">abstract-winbar</h3>

  <p align="center">
     Neovim Winbar: Elevating Awesome. Simple, Dynamic, Navic-Powered.
    <br/>
  </p>
</p>

![Contributors](https://img.shields.io/github/contributors/Abstract-IDE/abstract-winbar?color=dark-green) ![Stargazers](https://img.shields.io/github/stars/Abstract-IDE/abstract-winbar?style=social) ![Issues](https://img.shields.io/github/issues/Abstract-IDE/abstract-winbar) ![License](https://img.shields.io/github/license/Abstract-IDE/abstract-winbar)

## Table Of Contents

- [About the Project](#about-the-project)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## About The Project

`abstract-winbar` is a Neovim plugin that enhances code editing by providing a dynamic status bar. Built on top of the Navic plugin, it offers essential file information, modification indicators, and seamless integration with Navic for efficient code navigation.
![Screen Shot](https://github.com/Abstract-IDE/abstract-winbar/assets/41078534/0335bdc0-f5df-4581-bb47-2ff5271bf1bc)

## Getting Started

### Prerequisites

[nvim-navic](https://github.com/SmiteshP/nvim-navic)
<br />
[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

### Installation

use your favorite plugin manager

##### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
	"Abstract-IDE/abstract-winbar",
	dependencies = {
		"SmiteshP/nvim-navic",
		"kyazdani42/nvim-web-devicons",
	},
},
```

## Usage

```lua
require("abstract-winbar").setup()
```

<details>
	<summary>
		default config
	</summary>

```lua
require("abstract-winbar").setup({
	exclude_filetypes = {
		"",
		"alpha",
		"dap-repl",
		"dap-terminal",
		"dapui_breakpoints",
		"dapui_console",
		"dapui_scopes",
		"dapui_stacks",
		"dapui_watches",
		"dashboard",
		"DressingSelect",
		"harpoon",
		"help",
		"Jaq",
		"lab",
		"lazy",
		"lir",
		"Markdown",
		"mason",
		"neo-tree",
		"neogitstatus",
		"notify",
		"NvimTree",
		"Outline",
		"packer",
		"spectre_panel",
		"startify",
		"TelescopePrompt",
		"toggleterm",
		"Trouble",
	},
})
```

</details>
<details>
	<summary>
		example: configure navic.nvim+abstract-winbar
	</summary>

```lua
local _winbar, winbar = pcall(require, "abstract-winbar")
local _navic, navic = pcall(require, "nvim-navic")
if not _winbar or not _navic then
	return
end

navic.setup({
	highlight = true,
	separator = " ",
	depth_limit = 0,
	depth_limit_indicator = "..",

	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = " ",
		Interface = " ",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = " ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = " ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
})

winbar.setup({
	exclude_filetypes = {},
})
```

</details>

## License

Distributed under the MIT License. See [LICENSE](https://github.com/Abstract-IDE/abstract-winbar/blob/main/LICENSE) for more information.

## Acknowledgements

- [shaankhan (for README)](https://readme.shaankhan.dev/)
