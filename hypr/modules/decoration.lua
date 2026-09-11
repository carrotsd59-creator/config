-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    decoration = {
        rounding       = 24,
        rounding_power = 4,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = false,
            size      = 6,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },
})
