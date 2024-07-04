const hyprland = await Service.import("hyprland")
const audio = await Service.import("audio")
const battery = await Service.import("battery")
const systemtray = await Service.import("systemtray")

const date = Variable("", {
    poll: [1000, 'date "+%d-%b-%Y"'],
});

const time = Variable("", {
    poll: [1000, 'date "+%H:%M"'],
});

function Workspaces() {
    const activeId = hyprland.active.workspace.bind("id")
    const workspaces =
        hyprland.bind("workspaces")
            .as(ws => 
                ws.sort(({id:a},{id:b}) => a - b)
                .map(({ id }) => Widget.Button({
                    on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
                    child: Widget.Label(`${id}`),
                    class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
                }
            ))
        )

    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
    })
}

function ClientTitle() {
    return Widget.Label({
        class_name: "client-title",
        label: hyprland.active.client.bind("title"),
    })
}

function Calendar() {
    return Widget.Label({
        class_name: "calendar",
        label: date.bind(),
    })
}

function Clock() {
    return Widget.Label({
        class_name: "clock",
        label: time.bind()
    })
}

function Volume() {
    const icons = {
        101: "overamplified",
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    function getIcon() {
        const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)

        return `audio-volume-${icons[icon]}-symbolic`
    }

    const icon = Widget.Icon({
        icon: Utils.watch(getIcon(), audio.speaker, getIcon),
    })

    const slider = Widget.Slider({
        hexpand: true,
        draw_value: false,
        min: 0,
        max: 1.5,
        on_change: ({ value }) => audio.speaker.volume = value,
        setup: self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0
        }),
    })

    return Widget.Box({
        class_name: "volume",
        css: "min-width: 140px",
        children: [icon, slider],
    })
}

function BatteryLabel() {
    const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0)
    const icon = battery.bind("percent").as(p =>
        `battery-level-${Math.floor(p / 10) * 10}-symbolic`)

    return Widget.Box({
        class_name: "battery",
        visible: battery.bind("available"),
        children: [
            Widget.Icon({ icon }),
            Widget.LevelBar({
                widthRequest: 120,
                vpack: "center",
                value,
            }),
        ],
    })
}

function SysTray() {
    const items = systemtray.bind("items")
        .as(items => items.map(item => 
            Widget.Button({
                child: Widget.Icon({ icon: item.bind("icon") }),
                on_primary_click: (_, event) => item.openMenu(event),
                on_secondary_click: (_, event) => item.openMenu(event),
                tooltip_markup: item.bind("tooltip_markup"),
            }))
        );

    return Widget.Box({
        children: items,
    });
}

function Separator() {
    return Widget.Separator({
        class_name: "separator",
        vertical: false,
    });
}

function Left() {
    return Widget.Box({
        spacing: 8,
        children: [
            Workspaces(),
            Separator(),
            ClientTitle()
        ],
    })
}

function Center() {
    return Widget.Box({
        spacing: 8,
        children: [
            Calendar()
        ],
    })
}

function Right() {
    return Widget.Box({
        hpack: "end",
        spacing: 8,
        children: [
            SysTray(),
            Separator(),
            Volume(),
            Separator(),
            BatteryLabel(),
            Separator(),
            Clock()
        ],
    })
}

export function Bar(monitor = 0) {
    return Widget.Window({
        name: `bar-${monitor}`, // name has to be unique
        class_name: "bar",
        monitor,
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            start_widget: Left(),
            center_widget: Center(),
            end_widget: Right(),
        }),
    })
}
