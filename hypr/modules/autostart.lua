-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("sleep 1 && awww restore")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("systemctl enable --user --now mpd")
	hl.exec_cmd("mpc update")
	hl.exec_cmd("swayidle -w timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'" )
	hl.exec_cmd("swaync")
	hl.exec_cmd("waybar")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
