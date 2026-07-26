--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Starting widths
hl.window_rule({
    name = "blender_starting_width",
    match = { class = "blender" },

    scrolling_width = 0.97
})

hl.window_rule({
    name = "godot_starting_width",
    match = { class = "Godot" },

    scrolling_width = 0.97
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Disable Kitty blur
hl.window_rule({
    name    = "no-kitty-blur",
    match   = { namespace = "kitty" },
    no_blur = true

})

-- Enable SwayNC blur
hl.layer_rule({
    name         = "notif-center-blur",
    match        = { namespace = "swaync-control-center" },
    ignore_alpha = 0.5,
    blur         = true
})

hl.layer_rule({
    name         = "notif-blur",
    match        = { namespace = "swaync-notification-window" },
    ignore_alpha = 0.5,
    blur         = true
})

-- Slide SwayNC window from right
hl.layer_rule({
    name      = "notif-center-animation",
    match     = { namespace = "swaync-control-center" },
    animation = "slide right"
})

hl.layer_rule({
    name      = "notif-animation",
    match     = { namespace = "swaync-notification-window" },
    animation = "slide right"
})
