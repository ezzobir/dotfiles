--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Firefox window rule
hl.window_rule({
    name  = "firefox-on-ws1",
    match = { class = "^(firefox)$" },
    -- workspace = "1 silent"
    workspace = "1"
})

-- -- Kitty window rule
-- hl.window_rule({
--     name  = "kitty-on-ws2",
--     match = { class = "^(kitty)$" },
--     -- workspace = "1 silent"
--     workspace = "2"
-- })

-- Telegram window rule
hl.window_rule({
    name  = "telegram-on-ws3",
    match = { class = "^(org.telegram.desktop)$" },
    -- workspace = "1 silent"
    workspace = "3"
})
