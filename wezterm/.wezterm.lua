local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
	top = 35,
}
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Catppuccin Mocha"
config.font_size = 15.0

wezterm.on("update-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

wezterm.on("activate-mod-panes", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	overrides.window_background_opacity = 0.7
	window:set_config_overrides(overrides)

	window:perform_action(
		act.ActivateKeyTable({
			name = "mod_panes",
			one_shot = false,
		}),
		pane
	)
end)

wezterm.on("deactivate-mod-panes", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	overrides.window_background_opacity = nil
	window:set_config_overrides(overrides)

	window:perform_action("PopKeyTable", pane)
end)

config.keys = {
	{
		key = "h",
		mods = "ALT|SHIFT|CTRL",
		action = act.EmitEvent("activate-mod-panes"),
	},
	{
		key = "j",
		mods = "ALT|SHIFT|CTRL",
		action = act.PaneSelect({
			alphabet = "etovxqpdygfblzhckisuran",
		}),
	},
	{
		key = "j",
		mods = "ALT|SHIFT|CTRL",
		action = act.PaneSelect({
			alphabet = "etovxqpdygfblzhckisuran",
		}),
	},
	{ key = "h", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Down") },
}

config.key_tables = {
	mod_panes = {
		-- split panes
		{ key = "h", mods = "CTRL", action = act.SplitPane({
			direction = "Left",
		}) },
		{ key = "l", mods = "CTRL", action = act.SplitPane({
			direction = "Right",
		}) },
		{ key = "k", mods = "CTRL", action = act.SplitPane({
			direction = "Up",
		}) },
		{ key = "j", mods = "CTRL", action = act.SplitPane({
			direction = "Down",
		}) },

		-- resize panes
		{ key = "h", mods = "SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", mods = "SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "k", mods = "SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "j", mods = "SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },

		-- move panes
		{ key = "h", action = act.ActivatePaneDirection("Left") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },

		{ key = "x", action = act.CloseCurrentPane({ confirm = true }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = act.EmitEvent("deactivate-mod-panes") },
	},
}

return config
