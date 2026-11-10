
-- Main modifier
local mod = "SUPER"

-- Helper for application launch bindings
local function app(key, command)
    hl.bind(mod .. " + " .. key, hl.dsp.exec_cmd(command))
end

-- Applications
app("RETURN", "alacritty")
app("C", "chromium")
app("D", "noctalia msg panel-toggle launcher")
app("E", "nautilus")
app("F", "firefox")
app("G", "gnucash")
app("K", "keepassxc")
app("L", "hyprlock")
app("P", "proton-pass")
app("Q", "qalculate-gtk")
app("S", 'signal-desktop --password-store="gnome-libsecret"')
app("T", "thunderbird")
app("V", "SDL_VIDEODRIVER=x11 vcmiclient")
app("X", "gnome-text-editor")
app("Y", "freetube")

-- Special actions
hl.bind(mod .. " + SHIFT + B",
    hl.dsp.exec_cmd(
        "virsh --connect qemu:///system start Bank && virt-viewer --connect qemu:///system Bank"
    )
)

hl.bind(mod .. " + SHIFT + F",
    hl.dsp.window.fullscreen({ mode = "fullscreen" })
)

hl.bind(mod .. " + SHIFT + M",
    hl.dsp.exec_cmd("noctalia msg panel-open session")
)

hl.bind(mod .. " + SHIFT + P", hl.dsp.exit())
hl.bind(mod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + R", hl.dsp.force_renderer_reload())

-- Temperature
hl.bind(mod .. " + F7", hl.dsp.exec_cmd(
    "busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 1500"
))

hl.bind(mod .. " + F8", hl.dsp.exec_cmd(
    "busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500"
))

-- Swap active workspaces between monitors
hl.bind(mod .. " + SPACE",
    hl.dsp.workspace.swap_monitors({
        monitor1 = "current",
        monitor2 = "+1",
    })
)

-- Workspace switching: numeric
for i = 1, 10 do
    local key = tostring(i % 10)
    local workspace = tostring(i)

    hl.bind(mod .. " + " .. key,
        hl.dsp.focus({ workspace = workspace })
    )

    hl.bind(mod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = workspace,
            follow = false,
        })
    )
end

-- Named workspaces
local letters = "ABCDEFGHIJ"

for i = 1, #letters do
    local letter = letters:sub(i, i)
    local key = tostring(i % 10)

    hl.bind(mod .. " + CTRL + " .. key,
        hl.dsp.focus({ workspace = "name:" .. letter })
    )
end

-- Relative workspace navigation
hl.bind(mod .. " + LEFT",
    hl.dsp.focus({ workspace = "e-1" })
)

hl.bind(mod .. " + RIGHT",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(mod .. " + SHIFT + LEFT",
    hl.dsp.window.move({ workspace = "e-1", follow = false })
)

hl.bind(mod .. " + SHIFT + RIGHT",
    hl.dsp.window.move({ workspace = "e+1", follow = false })
)

-- Swap windows
hl.bind(mod .. " + CTRL + LEFT",
    hl.dsp.window.swap({ direction = "l" })
)

hl.bind(mod .. " + CTRL + RIGHT",
    hl.dsp.window.swap({ direction = "r" })
)

-- Mouse wheel workspace switching
hl.bind(mod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e-1" })
)

hl.bind(mod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e+1" })
)

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(
    "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.5"
))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(
    "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd(
    "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
))

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd(
    'grim -g "$(slurp)" - | swappy -f -'
))

-- Mouse bindings
hl.bind(mod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(mod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)
