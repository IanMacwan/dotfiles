-- ===================================================
--
--            [ Input/Device Configuration ]
--
-- ===================================================

-- For all categories, see https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        touchpad = {
            natural_scroll = false,
        },

        sensitivity = 0, -- -1.0 to 1.0, 0 means no modification.
    },
})

-- 3-finger horizontal swipe switches workspaces
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- Example per-device config
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
