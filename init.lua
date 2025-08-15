vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Кирил <- spellcheck check check
-- Most of defaults are in mini.basics
vim.opt.swapfile = false
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.langmap =
"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.opt.confirm = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.spelllang = { "en_us", "ru_ru" }
vim.opt.scrolloff = 5
vim.opt.winborder = ""
vim.opt.foldmethod = "expr"
vim.opt.foldcolumn = "0"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 4
-- vim.opt.background = "dark"
vim.opt.list = false
vim.g.loaded_python3_provider = 0
vim.opt.listchars = {
	tab = "» ", -- Display tabs as ▸ followed by a space
	trail = "·", -- Show trailing spaces as middle dots
	eol = " ", -- Show end-of-line as a carriage return symbol
	space = "⋅", -- Show spaces as small dots
	nbsp = "␣", -- Show non-breaking spaces as a specific symbol
	extends = "→", -- Show when a line extends beyond the screen
	precedes = "←", -- Show when a line is preceded from the left
}

-- Enable lsp's
vim.lsp.enable({ "lua_ls", "gopls", "systemd_ls", "hyprls", "bashls", "yamlls", "docker-language-server" })
vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end)
vim.keymap.set("n", "<Leader>o", ":update | source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<Leader>n", ":messages<CR>")
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<Leader>lf", function() vim.lsp.buf.format() end, {})

-- Plugin installations
vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.nvim",           version = 'main' },
	{ src = "https://github.com/folke/flash.nvim",                version = 'main' },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim",        version = 'main' },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/Saghen/blink.cmp",                version = "v1.6.0" },
	{ src = "https://github.com/rafamadriz/friendly-snippets",    version = "main" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator",    version = "master" },
	{ src = "https://github.com/f-person/auto-dark-mode.nvim",    version = "master" },
})

-- Plugin configurations
require("gruvbox").setup({
	transparent_mode = false,
	overrides = {
		-- Pmenu = { bg = "#282828" },
	},
})
vim.cmd.colorscheme "gruvbox"
--- [[
-- https://github.com/echasnovski/mini.basics
require('mini.basics').setup({
	options = {
		basic = true,
		extra_ui = false,
		win_borders = '',
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

-- https://github.com/echasnovski/mini.comment
require('mini.comment').setup()

-- https://github.com/echasnovski/mini.pairs
require('mini.pairs').setup()

-- https://github.com/echasnovski/mini.surround
require('mini.surround').setup({
	mappings = {
		add = 'ms',           -- Add surrounding in Normal and Visual modes
		delete = 'md',        -- Delete surrounding
		replace = 'mr',       -- Replace surrounding
		find = 'gsf',         -- Find surrounding (to the right)
		find_left = 'gsF',    -- Find surrounding (to the left)
		highlight = 'gsh',    -- Highlight surrounding
		update_n_lines = 'gsn', -- Update `n_lines`

		suffix_last = 'l',    -- Suffix to search with "prev" method
		suffix_next = 'n',    -- Suffix to search with "next" method
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

-- https://github.com/echasnovski/mini.cursorword
require('mini.cursorword').setup()

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
		fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
		hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
		todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
		note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})

-- https://github.com/echasnovski/mini.starter
-- require('mini.starter').setup()

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
vim.keymap.set("n", "<Leader>?", function() MiniExtra.pickers.history() end)
vim.keymap.set("n", "<Leader>j", function() MiniExtra.pickers.list({ scope = "quickfix" }) end)
vim.keymap.set("n", '<Leader>"', function() MiniExtra.pickers.registers() end)
-- vim.keymap.set("n", '<Leader>ss', function() MiniExtra.pickers.spellsuggest() end)
vim.keymap.set("n", "<Leader>d", function() MiniExtra.pickers.diagnostic({ scope = "current"}) end)
vim.keymap.set("n", "<Leader>D", function() MiniExtra.pickers.diagnostic({ scope = "all"}) end)
vim.keymap.set("n", '<Leader>s', function() MiniExtra.pickers.lsp({ scope = 'document_symbol' }) end)
vim.keymap.set("n", '<Leader>S', function() MiniExtra.pickers.lsp({ scope = 'workspace_symbol' }) end)
vim.keymap.set("n", 'gD', function() MiniExtra.pickers.lsp({ scope = 'declaration' }) end)
vim.keymap.set("n", 'gd', function() MiniExtra.pickers.lsp({ scope = 'definition' }) end)
vim.keymap.set("n", 'gi', function() MiniExtra.pickers.lsp({ scope = 'implementation' }) end)
vim.keymap.set("n", 'gr', function() MiniExtra.pickers.lsp({ scope = 'references' }) end)
vim.keymap.set("n", 'gt', function() MiniExtra.pickers.lsp({ scope = 'type_definition' }) end)
vim.keymap.set("n", "<Leader>gb", function() MiniExtra.pickers.git_branches() end)
vim.keymap.set("n", "<Leader>gc", function() MiniExtra.pickers.git_commits() end)
vim.keymap.set("n", "<Leader>gf", function() MiniExtra.pickers.git_files() end)
vim.keymap.set("n", "<Leader>gh", function() MiniExtra.pickers.git_hunks() end)
vim.keymap.set("n", "<Leader>mh", function() MiniExtra.pickers.hl_groups() end)
vim.keymap.set("n", "<Leader>mp", function() MiniExtra.pickers.hipatterns() end)
vim.keymap.set("n", "<Leader>mk", function() MiniExtra.pickers.keymaps() end)
-- https://github.com/echasnovski/mini.files
require('mini.files').setup({
	options = {
		permanent_delete = false,
	},
})
vim.keymap.set("n", "<Leader>e", function() MiniFiles.open() end)

-- https://github.com/echasnovski/mini.git
require('mini.git').setup()

-- https://github.com/echasnovski/mini.diff
require('mini.diff').setup()

-- https://github.com/echasnovski/mini.sessions
require('mini.sessions').setup({
	autoread = false,
	autowrite = true,
})

vim.keymap.set("n", "<Leader>mw", function()
	local session_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	MiniSessions.write(session_name)
end)
vim.keymap.set("n", "<Leader>mr", function()
	local session_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	MiniSessions.read(session_name)
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
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end)

-- https://github.com/nvim-treesitter/nvim-treesitter
local ensureInstalled = {
	"lua",
	"go",
	"gomod",
	"gosum",
	"gotmpl",
	"gowork",
	"css",
	"html",
	"css",
	"javascript", "typescript",
	"yaml",
	"toml",
	"ini",
	"systemd",
	"hyprls"
}
require("nvim-treesitter").install(ensureInstalled)

-- https://github.com/Saghen/blink.cmp
require("blink.cmp").setup({
	cmdline = { enabled = false },
	completion = {
		accept = { auto_brackets = { enabled = false }, },
		list = { selection = { preselect = false, auto_insert = false } },
	},
	keymap = {
		preset = 'default',
		['<C-x>'] = {'show_signature', 'hide_signature'},
		['<C-l>'] = {'snippet_forward'},
		['<C-h>'] = {'snippet_backward'},
	},
	signature = {
		enabled = true,
	},
	appearance = {
		nerd_font_variant = 'mono',
		use_nvim_cmp_as_default = false,
	},
	fuzzy = {
	},
})

-- https://github.com/christoomey/vim-tmux-navigator
vim.keymap.set({"n", "i"}, "<C-l>", "<Cmd>TmuxNavigateRight<CR>")
vim.keymap.set({"n", "i"}, "<C-h>", "<Cmd>TmuxNavigateLeft<CR>")
vim.keymap.set({"n", "i"}, "<C-k>", "<Cmd>TmuxNavigateUp<CR>")
vim.keymap.set({"n", "i"}, "<C-j>", "<Cmd>TmuxNavigateDown<CR>")

require("auto-dark-mode").setup({
	set_dark_mode = function ()
		vim.api.nvim_set_option_value("background", "dark", {})
	end,
	set_light_mode = function ()
		vim.api.nvim_set_option_value("background", "light", {})
	end
})
