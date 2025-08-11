vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Most of defaults are in mini.basics
vim.opt.swapfile = false
vim.opt.confirm = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.spelllang = { "en", "ru" }
vim.opt.scrolloff = 5
vim.opt.list = false
vim.opt.listchars = {
	tab = "» ",     -- Display tabs as ▸ followed by a space
	trail = "·",    -- Show trailing spaces as middle dots
	eol = " ",      -- Show end-of-line as a carriage return symbol
	space = "⋅",    -- Show spaces as small dots
	nbsp = "␣",     -- Show non-breaking spaces as a specific symbol
	extends = "→",  -- Show when a line extends beyond the screen
	precedes = "←", -- Show when a line is preceded from the left
}


local keymap_opts = { silent = true }
vim.keymap.set("n", "<leader>so", ":update | source<CR>", keymap_opts)
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", keymap_opts)

-- Plugin installations
vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.basics", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.base16", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.comment", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.pairs", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.surround", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.splitjoin", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.trailspace", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.statusline", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.icons", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.indentscope", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.hipatterns", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.starter", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.pick", version = 'main' },
	{ src = "https://github.com/echasnovski/mini.files", version = 'main' },
})

-- echasnovski/mini.basics
require('mini.basics').setup({
	options = {
		basic = true,
		extra_ui = true,
		win_borders = 'solid',
	},
	mappings = {
		basic = true,
		option_toggle_prefix = "<Leader>t",
		windows = true,
	},
	autocommands = {
		basic = true,
		relnum_in_visual_mode = true,
	},
})

-- echasnovski/mini.base16
require('mini.base16').setup({
	palette = {
		base00 = "#181818",
		base01 = "#282828",
		base02 = "#383838",
		base03 = "#585858",
		base04 = "#b8b8b8",
		base05 = "#d8d8d8",
		base06 = "#e8e8e8",
		base07 = "#f8f8f8",
		base08 = "#ab4642",
		base09 = "#dc9656",
		base0A = "#f7ca88",
		base0B = "#a1b56c",
		base0C = "#86c1b9",
		base0D = "#7cafc2",
		base0E = "#ba8baf",
		base0F = "#a16946",
	},
	use_cterm = nil,
	plugins = {
		default = true,
	},
})

-- echasnovski/mini.comment
require('mini.comment').setup({})

-- echasnovski/mini.pairs
require('mini.pairs').setup({})

-- echasnovski/mini.surround
require('mini.surround').setup({})

-- echasnovski/mini.splitjoin
require('mini.splitjoin').setup({})

-- echasnovski/mini.trailspace
require('mini.trailspace').setup({})
vim.keymap.set("n", "<leader>ts", function() MiniTrailspace.trim() end)

-- echasnovski/mini.statusline
require('mini.statusline').setup({})

-- echasnovski/mini.icons
require('mini.icons').setup({})

-- echasnovski/mini.indentscope
require('mini.indentscope').setup({
	draw = {
		animation = require('mini.indentscope').gen_animation.none(),
	}
})

-- echasnovski/mini.hipatterns
-- NOTE: aboba #121243
require('mini.hipatterns').setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
		hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
		todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
		note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})

-- echasnovski/mini.starter
require('mini.starter').setup({})

-- echasnovski/mini.pick
require('mini.pick').setup({})
vim.keymap.set("n", "<Leader>f", function() MiniPick.builtin.files() end)
vim.keymap.set("n", "<Leader>h", function() MiniPick.builtin.help() end)
vim.keymap.set("n", "<Leader>b", function() MiniPick.builtin.buffers() end)
vim.keymap.set("n", "<Leader>r", function() MiniPick.builtin.resume() end)
vim.keymap.set("n", "<Leader>/", function() MiniPick.builtin.grep_live() end)

-- echasnovski/mini.files
require('mini.files').setup({})
vim.keymap.set("n", "<Leader>e", function() MiniFiles.open() end)
