local tool = {}
local settings = require("core.settings")

tool["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}
-- This is specifically for fcitx5 users who code in languages other than English
-- tool["pysan3/fcitx5.nvim"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	cond = vim.fn.executable("fcitx5-remote") == 1,
-- 	config = require("tool.fcitx5"),
-- }
tool["Bekaboo/dropbar.nvim"] = {
	lazy = false,
	config = require("tool.dropbar"),
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
}
tool["okuuva/auto-save.nvim"] = {
	lazy = true,
	cmd = "ASToggle", -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		trigger_events = {
			immediate_save = { "FocusLost", "BufLeave" },
			defer_save = { "CursorHold", "TextChanged", "InsertLeave" },
			cancel_deferred_save = { "CursorMoved", "CursorHoldI", "InsertEnter" },
		},
		debounce_delay = 1500,
		write_all_buffers = true,
	},
}
-- tool["neo451/jieba.nvim"] = {
-- 	lazy = false,
-- 	dependencies = { "noearc/jieba-lua" },
-- 	opts = {},
-- }
tool["nvim-tree/nvim-tree.lua"] = {
	lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
	config = require("tool.nvim-tree"),
}
tool["ibhagwan/smartyank.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("tool.smartyank"),
}
tool["michaelb/sniprun"] = {
	lazy = true,
	-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
	-- if you encountered error about no executable sniprun found.
	build = "bash ./install.sh",
	cmd = { "SnipRun", "SnipReset", "SnipInfo" },
	config = require("tool.sniprun"),
}
tool["akinsho/toggleterm.nvim"] = {
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = require("tool.toggleterm"),
}
tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("tool.which-key"),
}
tool["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = require("tool.wilder"),
	dependencies = { "romgrk/fzy-lua-native" },
}
if settings.use_chat then
	tool["olimorris/codecompanion.nvim"] = {
		lazy = true,
		event = "VeryLazy",
		config = require("tool.codecompanion"),
		dependencies = {
			{ "ravitemer/codecompanion-history.nvim" },
		},
	}
end
if settings.search_backend == "fzf" then
	-- require fzf binary installed
	tool["ibhagwan/fzf-lua"] = {
		lazy = true,
		event = "VeryLazy",
		config = require("tool.fzf-lua"),
	}
end

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "jvgrootveld/telescope-zoxide" },
		{ "debugloop/telescope-undo.nvim" },
		{ "nvim-telescope/telescope-frecency.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"ayamir/search.nvim",
			config = require("tool.search"),
		},
		{
			"ayamir/project.nvim",
			event = { "CursorHold", "CursorHoldI" },
			config = require("tool.project"),
		},
		{
			"aaronhallaert/advanced-git-search.nvim",
			cmd = { "AdvancedGitSearch" },
			dependencies = {
				"tpope/vim-rhubarb",
				"tpope/vim-fugitive",
				"sindrets/diffview.nvim",
			},
		},
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
tool["mfussenegger/nvim-dap"] = {
	lazy = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	config = require("tool.dap"),
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = require("tool.dap.dapui"),
			dependencies = {
				"nvim-neotest/nvim-nio",
			},
		},
		{ "jay-babu/mason-nvim-dap.nvim" },
	},
}

return tool
