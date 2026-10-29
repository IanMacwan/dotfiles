-- ===================================================
--
--              [ Rules Configuration ]
--
-- ===================================================
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Slight transparency for these apps
for _, class in ipairs({ "Code", "discord", "obsidian", "spotify", "thunar", "kitty" }) do
    hl.window_rule({
        name    = "opacity-" .. class,
        match   = { class = class },
        opacity = "0.97 0.97",
    })
end

hl.window_rule({
    name   = "pseudo-kitty",
    match  = { class = "kitty" },
    pseudo = true,
})

-- Example: float a window
-- hl.window_rule({ name = "float-kitty", match = { class = "^(kitty)$" }, float = true })
