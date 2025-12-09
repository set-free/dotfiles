-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_kitty_graphics = true
config.enable_wayland = true

-- размер окна при старте
config.initial_rows = 35
config.initial_cols = 135

--- отступы по краям внутри терминала
config.window_padding = {
	top = 7,
	bottom = 7,
	left = 7,
	right = 7,
}

config.color_scheme = "Catppuccin Frappe" -- тема терминала

-- Set fonts
config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 13 -- размер шрифта

-- my cfg
config.enable_scroll_bar = true -- включить скролбар
config.default_prog = { "/usr/bin/fish" } -- запустить сразу fish shell
-- config.hide_tab_bar_if_only_one_tab = true -- отключить вкладки если открыта только одна вкладка
config.window_decorations = "RESIZE" -- отлючить декарирование окна
config.use_fancy_tab_bar = false -- отключить gui для вкладок (будет в txt)

-- my key's
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- разделить экран по горизонатли LEADER_KEY + h
	{ key = "h", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- разделить экран по вертикали LEADER_KEY + v
	{ key = "v", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- перейти на экран слева
	{ mods = "CTRL", key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
	{ mods = "CTRL", key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
	{ mods = "CTRL", key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
	{ mods = "CTRL", key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
	-- расширить экран влево на 10 симоволов
	{ mods = "LEADER", key = "LeftArrow", action = wezterm.action.AdjustPaneSize({ "Left", 10 }) },
	{ mods = "LEADER", key = "RightArrow", action = wezterm.action.AdjustPaneSize({ "Right", 10 }) },
	{ mods = "LEADER", key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Down", 10 }) },
	{ mods = "LEADER", key = "UpArrow", action = wezterm.action.AdjustPaneSize({ "Up", 10 }) },
	-- растянуть на весь экран панель
	{ mods = "LEADER",key = "m",  action = wezterm.action.TogglePaneZoomState },
	-- растянуть на весь экран окно
	{ key = "n", mods = "SHIFT|CTRL", action = wezterm.action.ToggleFullScreen },
}

-- показывать значё волны когда вкл. лидер режим.
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

return config
