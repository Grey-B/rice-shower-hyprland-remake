---------------
---- INPUT ----
---------------

hl.config({
    input = {
        -- Keyboard
        kb_layout    = "br",
        kb_variant   = "abnt2",
        repeat_delay = 300, -- How long to detect a key being held
        repeat_rate  = 50,  -- How much to repeat a held key

        -- Mouse
        follow_mouse = 1,
        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        -- Touchpad
        touchpad     = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.config({
  cursor = {
    no_hardware_cursors = true,
  },
})
