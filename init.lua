vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Кирил
-- Most of defaults are in mini.basics
vim.opt.swapfile = false
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.langmap="ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.opt.confirm = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.spelllang = { "en_us", "ru_ru" }
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

vim.keymap.set("n", "<Leader>so", ":update | source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<Leader>n", ":messages<CR>")
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

vim.keymap.set({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true })
vim.keymap.set({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true })

vim.keymap.set({ 'n', 'x' }, "<leader>y", '"+y"')
vim.keymap.set({ 'n', 'x' }, "<leader>p", '"+p"')

-- Plugin installations
vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.nvim", version = 'main' },
	{ src = "https://github.com/folke/flash.nvim", version = 'main' },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim", version = 'main' },
})

vim.cmd.colorscheme "gruvbox"

--- [[
------------------ mini.nvim START ------------------
-- https://github.com/echasnovski/mini.basics
require('mini.basics').setup({
	options = {
		basic = true,
		extra_ui = true,
		win_borders = 'solid',
	},
	mappings = {
		basic = false,
		option_toggle_prefix = "<Leader>t",
		windows = true,
	},
	autocommands = {
		basic = true,
		relnum_in_visual_mode = true,
	},
})

-- https://github.com/echasnovski/mini.comment
require('mini.comment').setup()

-- https://github.com/echasnovski/mini.pairs
require('mini.pairs').setup()

-- https://github.com/echasnovski/mini.surround
require('mini.surround').setup({
	mappings = {
		add = 'ms', -- Add surrounding in Normal and Visual modes
		delete = 'md', -- Delete surrounding
		replace = 'mr', -- Replace surrounding
		find = 'gsf', -- Find surrounding (to the right)
		find_left = 'gsF', -- Find surrounding (to the left)
		highlight = 'gsh', -- Highlight surrounding
		update_n_lines = 'gsn', -- Update `n_lines`

		suffix_last = 'l', -- Suffix to search with "prev" method
		suffix_next = 'n', -- Suffix to search with "next" method
	},
})

-- https://github.com/echasnovski/mini.splitjoin
require('mini.splitjoin').setup()

-- https://github.com/echasnovski/mini.ai
require('mini.ai').setup()

-- https://github.com/echasnovski/mini.trailspace
require('mini.trailspace').setup()
vim.keymap.set("n", "<Leader>tt", function() MiniTrailspace.trim() end)

-- https://github.com/echasnovski/mini.statusline
require('mini.statusline').setup()

-- https://github.com/echasnovski/mini.icons
require('mini.icons').setup()

-- https://github.com/echasnovski/mini.indentscope
require('mini.indentscope').setup({
	draw = {
		animation = require('mini.indentscope').gen_animation.none(),
	}
})

-- https://github.com/echasnovski/mini.hipatterns
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

-- https://github.com/echasnovski/mini.starter
require('mini.starter').setup()

-- https://github.com/echasnovski/mini.pick
require('mini.pick').setup({
	options = {
		use_cahce = true,
	},
})

vim.keymap.set("n", "<Leader>f", function() MiniPick.builtin.files() end)
vim.keymap.set("n", "<Leader>h", function() MiniPick.builtin.help() end)
vim.keymap.set("n", "<Leader>b", function() MiniPick.builtin.buffers() end)
vim.keymap.set("n", "<Leader>r", function() MiniPick.builtin.resume() end)
vim.keymap.set("n", "<Leader>/", function() MiniPick.builtin.grep_live() end)
vim.keymap.set("n", "<Leader>d", function() MiniExtra.pickers.diagnostics() end)
vim.keymap.set("n", "<Leader>?", function() MiniExtra.pickers.history() end)
vim.keymap.set("n", "<Leader>j", function() MiniExtra.pickers.list( { scope = "quickfix" }) end)
vim.keymap.set("n", '<Leader>"', function() MiniExtra.pickers.registers() end)
vim.keymap.set("n", '<Leader>ss', function() MiniExtra.pickers.spellsugest() end)
vim.keymap.set("n", "<Leader>gb", function() MiniExtra.pickers.git_branches() end)
vim.keymap.set("n", "<Leader>gc", function() MiniExtra.pickers.git_commits() end)
vim.keymap.set("n", "<Leader>gf", function() MiniExtra.pickers.git_files() end)
vim.keymap.set("n", "<Leader>gh", function() MiniExtra.pickers.git_hunks() end)
vim.keymap.set("n", "<Leader>mh", function() MiniExtra.pickers.hl_groups() end)
vim.keymap.set("n", "<Leader>mk", function() MiniExtra.pickers.keymaps() end)

-- https://github.com/echasnovski/mini.files
require('mini.files').setup({})
vim.keymap.set("n", "<Leader>e", function() MiniFiles.open() end)

-- https://github.com/echasnovski/mini.git
require('mini.git').setup()

-- https://github.com/echasnovski/mini.diff
require('mini.diff').setup()

-- https://github.com/echasnovski/mini.sessions
require('mini.sessions').setup()
vim.keymap.set("n", "<Leader>sw", function()
	vim.ui.input({ prompt = 'Enter session name:' }, function(input)
		MiniSessions.write(input)
	end)
end)

-- https://github.com/echasnovski/mini.diff
require('mini.diff').setup()

-- https://github.com/echasnovski/mini.extra
require('mini.extra').setup()

------------------ mini.nvim END ------------------
-- ]]

-- https://github.com/folke/flash.nvim
require("flash").setup({
	labels = "sadfjklewcmpgh",
	label = {
		uppercase = false,
	},
	highlight = {
		groups = {
			current = "FlashMatch",
			label = "FlashCurrent",
		},
	}
})

vim.keymap.set({"n", "x", "o"}, "s", function() require("flash").jump() end)
