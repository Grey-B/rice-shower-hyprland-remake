---------------------
---- MY PROGRAMS ----
---------------------

-- SUPER key
local mainMod     = "SUPER"

-- Set programs that you use
local bar         = "/home/grey/.config/waybar/scripts/launch.sh"
local browser     = "zen-browser"
local clipboard   =
"cliphist list | rofi -dmenu -display-columns 2  -theme /home/grey/.config/rofi/type-4/style-7.rasi| cliphist decode | wl-copy"
local fileManager = "nautilus"
local launcher    = "/home/grey/.config/rofi/type-4/launcher.sh"
local lock        = "swaylock"
local logout      = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
local notif       = "swaync-client --toggle-panel"
local terminal    = "kitty"

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd(logout)) --Logout
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd(lock))   --Lock screen

-- Layout
hl.bind(mainMod .. " + W", hl.dsp.window.close())                      -- Close window
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" })) -- Toggle floating window
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())                     -- Toggle pseudo window
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))               -- Toggle split. Dwindle only
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(bar))               -- Reload Waybar and SwayNC

-- Open apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))        -- Terminal
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(browser)) -- Browser
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))          -- File manager
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(launcher))         -- App launcher
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(notif))                -- Notification center
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))            -- Clipboard

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.swap({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
---- or silently with mainMod + SHIFT + ALT = [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Switch to next and previous workspaces
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Print area, selected window and active monitor, respectively, and copy to clipboar
hl.bind("Print", hl.dsp.exec_cmd("hyprcap shot region -c"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprcap shot window -c"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprcap shot monitor:active -c"))

-- Color picker with autocopy
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprpicker -a"))

-- Toggle between scrolling and dwindle
hl.bind(mainMod .. " + L", function()
	local layouts = { "scrolling", "dwindle" }
	local workspace = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

	local next_layout = "dwindle"

	if not workspace then
		return
	end

	for i = 1, #layouts do
		if layouts[i] == workspace.tiled_layout then
			local next_layout_idx = (i % #layouts) + 1
			next_layout = layouts[next_layout_idx]
			break
		end
	end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
end)
