-- Execute your favorite apps at launch (start-only, like exec-once)
hl.on("hyprland.start", function()
    -- Notification daemon
    hl.exec_cmd("dunst")
    -- Authentication agent
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    -- Status bar
    hl.exec_cmd("waybar")
    -- Wallpaper manager
    hl.exec_cmd("hyprpaper")
    -- Hypridle
    hl.exec_cmd("hypridle")
end)

-- Multi-file config (resolved relative to ~/.config/hypr)
-- Order matters: env.lua defines the terminal/fileManager/browser globals used by binds.lua
require("modules.env")        -- Env/Alias settings
require("modules.monitors")   -- Monitor settings
require("modules.general")    -- General/Appearance settings
require("modules.input")      -- Input/Device settings
require("modules.rules")      -- Rule settings
require("modules.binds")      -- Keybinds settings

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})
