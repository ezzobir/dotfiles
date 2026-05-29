-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
  -- hl.exec_cmd("hyprpm reload -n")
  hl.exec_cmd("brightnessctl set 1")
  hl.exec_cmd("waypaper --restore")
  hl.exec_cmd("ashell")
  hl.exec_cmd("swaync")
  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

