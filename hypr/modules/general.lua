-- ===================================================
--
--         [ General/Appearance Configuration ]
--
-- ===================================================

hl.config({
    general = {
        -- Defaults: gaps_in = 5, gaps_out = 20, border_size = 2
        gaps_in     = 4,
        gaps_out    = 8,
        border_size = 0,

        col = {
            -- alt: active_border = "rgb(ebdbb2) rgb(d65d0e) 60deg"
            active_border   = "rgb(272727)",
            inactive_border = "rgb(272727)",
        },

        layout = "dwindle",

        -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false,

        snap = {
            enabled = true,
        },
    },

    decoration = {
        rounding = 0,

        blur = {
            enabled = false, -- default: true
            size    = 3,
            passes  = 1,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        disable_hyprland_logo = false,
        col = {
            splash = 0x665c54,
        },
        splash_font_family      = "CaskaydiaCove Nerd Font", -- JetBrains Mono
        force_default_wallpaper = 0, -- 0 or 1 to disable the anime mascot wallpapers
    },
})

-- Animations
hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default" })
