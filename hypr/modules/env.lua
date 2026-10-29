-- ===================================================
--
--         [ Environment/Alias Configuration ]
--
-- ===================================================

-- Some default env vars.
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct") -- change to qt6ct if you have that

-- Alias (globals on purpose, so other modules like binds.lua can use them)
terminal    = "kitty"
fileManager = "thunar" -- terminal .. " -- ranger"
menu        = "rofi -show drun"
browser     = "firefox"
