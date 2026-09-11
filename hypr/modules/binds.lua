-- Program
local menu = "./.config/rofi/type-2/launcher.sh"
local wallpaper = "./.config/rofi/wallpaper/launcher.sh"
local clipboard = "./.config/rofi/type-2/clipboard.sh"
local emoji = "rofimoji --selector rofi --selector-args '-theme ~/.config/rofi/type-2/style-2.rasi'"
local power = "./.config/rofi/powermenu/type-2/powermenu.sh"
---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- closeWindowBind:set_enabled(false)

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
--hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd (power))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(wallpaper))
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd(emoji))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind("SUPER + G", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))
---------------------
---- WINDOW --------
---------------------

-- Close
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Fullscreen State
hl.bind(
	"SUPER + ALT + F",
	hl.dsp.window.fullscreen_state({
		internal = 0,
		client = 2,
		action = "toggle",
	})
)

-- Float
hl.bind(
	mainMod .. " + Space",
	hl.dsp.window.float({
		action = "toggle",
	})
)

-- Fullscreen
hl.bind(
	mainMod .. " + F",
	hl.dsp.window.fullscreen({
		action = "toggle",
		mode = "fullscreen",
	})
)

-- Maximize
hl.bind(
	mainMod .. " + D",
	hl.dsp.window.fullscreen({
		action = "toggle",
		mode = "maximized",
	})
)

-- Pin
hl.bind(mainMod .. " + P", hl.dsp.window.pin())

-- Pseudo
hl.bind(mainMod .. " + J", hl.dsp.window.pseudo())

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

---------------------
---- MOVE WINDOW ----
---------------------

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))

hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))

hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))

hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

---------------------
---- RESIZE WINDOW --
---------------------

hl.bind(
	mainMod .. " + ALT + left",
	hl.dsp.window.resize({
		x = -10,
		y = 0,
		relative = true,
	}),
	{ repeating = true }
)

hl.bind(
	mainMod .. " + ALT + right",
	hl.dsp.window.resize({
		x = 10,
		y = 0,
		relative = true,
	}),
	{ repeating = true }
)

hl.bind(
	mainMod .. " + ALT + up",
	hl.dsp.window.resize({
		x = 0,
		y = -10,
		relative = true,
	}),
	{ repeating = true }
)

hl.bind(
	mainMod .. " + ALT + down",
	hl.dsp.window.resize({
		x = 0,
		y = 10,
		relative = true,
	}),
	{ repeating = true }
)

---------------------
---- MOUSE ----------
---------------------

-- Move window
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Resize window
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---------------------
---- WINDOW SPLIT ---
---------------------

hl.bind(mainMod .. " + Semicolon", hl.dsp.layout("splitratio -0.1"), { repeating = true })

hl.bind(mainMod .. " + Apostrophe", hl.dsp.layout("splitratio +0.1"), { repeating = true })

---------------------
---- WORKSPACES ----
---------------------

-- 1-9 and 0 -> 10
for i = 1, 10 do
	local key = i % 10

	-- Focus workspace
	hl.bind(
		mainMod .. " + " .. key,
		hl.dsp.focus({
			workspace = i,
		})
	)

	-- Move window to workspace
	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({
			workspace = i,
		})
	)
end

---------------------
---- WORKSPACE NAV --
---------------------

-- Scroll
hl.bind(
	mainMod .. " + mouse_down",
	hl.dsp.focus({
		workspace = "e-1",
	})
)

hl.bind(
	mainMod .. " + mouse_up",
	hl.dsp.focus({
		workspace = "e+1",
	})
)

-- Page Up / Down
hl.bind(
	mainMod .. " + Page_Up",
	hl.dsp.focus({
		workspace = "r-1",
	})
)

hl.bind(
	mainMod .. " + Page_Down",
	hl.dsp.focus({
		workspace = "r+1",
	})
)

---------------------
---- MOVE TO WORKSPACE
---------------------

-- Super + Alt + number
for i = 1, 10 do
	local key = i % 10

	hl.bind(
		mainMod .. " + ALT + " .. key,
		hl.dsp.window.move({
			workspace = i,
			follow = false,
		})
	)
end

-- Super + Alt + PageUp/PageDown
hl.bind(
	mainMod .. " + ALT + Page_Up",
	hl.dsp.window.move({
		workspace = "r-1",
	})
)

hl.bind(
	mainMod .. " + ALT + Page_Down",
	hl.dsp.window.move({
		workspace = "r+1",
	})
)

---------------------
---- SPECIAL --------
---------------------

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("special"))

-- Bring window back from special
hl.bind(
	mainMod .. " + ALT + S",
	hl.dsp.window.move({
		workspace = "special:special",
	})
)


-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


---------------------
---- SCREENSHOTS ----
---------------------

-- Region
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Active window
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window"))

-- Entire output
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output"))
