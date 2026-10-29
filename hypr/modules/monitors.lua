-- ===================================================
--
--              [ Monitors Configuration ]
--
-- ===================================================
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- Default
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-- Customized Rules
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@60",
    position = "0x0",
    scale    = 1,
    bitdepth = 8,
})

-- Fallback for any other monitor
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
    bitdepth = 8,
})
