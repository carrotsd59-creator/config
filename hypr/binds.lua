---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local browser = "google-chrome-stable"
local fileManager = "dolphin"
local menu = "hyprlauncher"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

---------------------
---- APPS ----------
---------------------

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("pkill waybar && waybar"))

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

---------------------
---- SESSION --------
---------------------

-- Lock
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"), { description = "Session: Lock" })

-- Suspend
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("systemctl suspend-then-hibernate"), { locked = true })

-- Logout
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)

-- Shutdown
hl.bind(
	"CTRL + SHIFT + ALT + SUPER + Delete",
	hl.dsp.exec_cmd("systemctl poweroff"),
	{ description = "Session: Shut down" }
)

---------------------
---- SCREENSHOTS ----
---------------------

-- Region
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Active window
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window"))

-- Entire output
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output"))

---------------------
---- UTILITIES ------
---------------------

--hl.bind(mainMod .. " + R", hl.dsp.global("quickshell:launcher"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("qs ipc call launcher toggle"))

-- Wallpaper selector
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("matuwall"))
---------------------
---- VOLUME ---------
---------------------

-- Speaker mute
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- Speaker volume up
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)

-- Speaker volume down
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)

-- Microphone mute
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

-- Super + Shift + M
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

---------------------
---- BRIGHTNESS -----
---------------------

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

---------------------
---- MEDIA ----------
---------------------

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

---------------------
---- VIRTUAL MACHINE
---------------------

hl.define_submap("virtual-machine", function()
	hl.bind("SUPER + ALT + F1", function()
		local current = hl.get_current_submap()

		if current == "virtual-machine" then
			hl.exec_cmd("notify-send 'Exited Virtual Machine submap' 'Keybinds re-enabled' -a Hyprland")

			hl.dispatch(hl.dsp.submap("reset"))
		elseif current == "" then
			hl.exec_cmd(
				"notify-send 'Entered Virtual Machine submap' 'Keybinds disabled. Hit SUPER+ALT+F1 to escape' -a Hyprland"
			)

			hl.dispatch(hl.dsp.submap("virtual-machine"))
		end
	end, { submap_universal = true })
end)

-- SOMETHING?
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("pkill swaync && swaync"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))

-- TIDE-ISLAND
hl.bind(
	"SUPER + Tab",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call overview toggle")
)
hl.bind(
	"ALT + Right",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide swipeRight")
)
hl.bind(
	"ALT + Left",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide swipeLeft")
)
hl.bind(
	"ALT + Down",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide showClock")
)
hl.bind(
	"ALT + T",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide showTimer")
)
hl.bind(
	"ALT + M",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide togglePlayer")
)
hl.bind(
	"ALT + C",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide toggleControlCenter")
)
hl.bind(
	"ALT + P",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide togglePowerMenu")
)
hl.bind(
	"ALT + N",
	hl.dsp.exec_cmd(
		"/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide toggleNotificationCenter"
	)
)
hl.bind(
	"ALT + W",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide toggleWallpaperPicker")
)
hl.bind(
	"ALT + slash",
	hl.dsp.exec_cmd(
		"/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide toggleApplicationLauncher"
	)
)
hl.bind(
	"ALT + F",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call island toggle")
)
hl.bind(
	"ALT + O",
	hl.dsp.exec_cmd("/usr/bin/quickshell ipc --any-display -p /usr/share/tide-island call tide toggleFileShelf")
)

-- WLOGOUT
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("wlogout"))

-- POWER MENU (quickshell)
hl.bind("SUPER + X", hl.dsp.global("quickshell:power-menu"))
