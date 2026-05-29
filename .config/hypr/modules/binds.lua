---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local file_manager = "kitty -e yazi"
local menu        = "hyprlauncher"
local browser     = "firefox"
local editor     = "emacs"

---------------------
---- KEYBINDINGS ----
---------------------

local main_mod = "SUPER" -- Sets "Windows" key as main modifier
local second_mod = "SUPER + SHIFT"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(main_mod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(second_mod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(second_mod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(main_mod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd(editor))
hl.bind(main_mod .. " + W", hl.dsp.exec_cmd("/home/ezzobir/efs/repos/github.com/woomer/target/debug/woomer"))
-- hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + P", hl.dsp.exec_cmd("gradia --screenshot=FULL --delay=1500"))
-- hl.bind(main_mod .. " + Y", hl.dsp.exec_cmd("waybar || waybar &"))
hl.bind(main_mod .. " + Y", hl.dsp.exec_cmd("pkill ashell || ashell &"))
hl.bind(main_mod .. " + X", hl.dsp.exec_cmd("wlogout"))
hl.bind(second_mod .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(main_mod .. " + N", hl.dsp.exec_cmd("task-waybar"))
-- hl.bind(main_mod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with main_mod + hjkl keys
hl.bind(main_mod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + j",  hl.dsp.focus({ direction = "down" }))

-- Move active window with second_mod + hjkl keys
hl.bind(second_mod .. " + h",  hl.dsp.window.move({ direction = "left" }))
hl.bind(second_mod .. " + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(second_mod .. " + k",    hl.dsp.window.move({ direction = "up" }))
hl.bind(second_mod .. " + j",  hl.dsp.window.move({ direction = "down" }))

hl.bind(main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Switch workspaces with main_mod + [0-9]
-- Move active window to a workspace with second_mod + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(main_mod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(second_mod .. " + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(main_mod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(second_mod .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with main_mod + scroll
hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with main_mod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

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

-- Scrolling Layout

hl.bind(main_mod .. " + period", hl.dsp.layout("move +col"))
hl.bind(main_mod .. " + comma", hl.dsp.layout("move -col"))
hl.bind(second_mod .. " + period", hl.dsp.layout("swapcol l"))
hl.bind(second_mod .. " + comma", hl.dsp.layout("swapcol r"))

-- hl.bind(main_mod .. " + C", hl.dsp.layout("promote"))

hl.bind(main_mod .. " + R", hl.dsp.layout("colresize -0.1"))
hl.bind(second_mod .. " + R", hl.dsp.layout("colresize +0.1"))
hl.bind(main_mod .. " + equal", hl.dsp.layout("colresize +conf"))
hl.bind(main_mod .. " + minus", hl.dsp.layout("colresize -conf"))
hl.bind(main_mod .. " + C", hl.dsp.layout("colresize 1.0"))
