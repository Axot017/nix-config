const audio = await Service.import('audio')
const hyprland = await Service.import('hyprland')
const network = await Service.import('network')

const Gap = () => Widget.Box({ class_name: 'gap' });

const Icon = (icon) => Widget.Label({
  class_name: 'topbar-icon',
  label: icon,
})

const Workspaces = () => Widget.Box({
  hpack: 'end',
  children: [
    Widget.Box(),
    Widget.Box({
      class_name: 'workspaces',
      children: Array.from({ length: 5 }, (_, i) => i + 1).map(i => Widget.Box({
        class_name: 'workspace-label',
        child: hyprland.active.workspace.bind("id").as(id => Icon(id === i ? "" : "")),
      })),
    })
  ]
})

const FocusedTitle = () => Widget.Box({
  children: [
    Widget.Box({
      class_name: 'window-title',
      visible: hyprland.active.client.bind('title').as(address => !!address),
      children: [
        Widget.Label({
          label: hyprland.active.client.bind('title'),
        })
      ]
    }),
    Widget.Box(),
  ],
})

const time = Variable('', {
  poll: [1000, () => {
    let date = new Date()
    let day = date.getDate().toString().padStart(2, '0')
    let month = (date.getMonth() + 1).toString().padStart(2, '0')
    let year = date.getFullYear()

    let hours = date.getHours().toString().padStart(2, '0')
    let minutes = date.getMinutes().toString().padStart(2, '0')

    return `${day}-${month}-${year} ${hours}:${minutes}`
  }],
})

const asBashCommand = (/** @type {string} */ command) => ["bash", "-c", command]
const cpuCommand = "top -bn1 | grep Cpu | awk '{print $2 + $4}'"
const formatCpu = (/** @type {string} */ out) => {
  const value = Math.floor(+out).toString()
  return `${value}%`
}
const cpu = Variable('', {
  poll: [1000, asBashCommand(cpuCommand), formatCpu],
})

const diskCommand = "df / | grep / | awk '{print 0 + $5}'"
const formatDisk = (/** @type {string} */ out) => {
  const value = Math.floor(+out).toString()
  return `${value}%`
}
const disk = Variable('', {
  poll: [60000, asBashCommand(diskCommand), formatDisk],
})

const memCommand = "free | grep Mem | awk '{print 100 - ($7/$2 * 100)}'"
const formatMem = (/** @type {string} */ out) => {
  const value = Math.floor(+out).toString()
  return `${value}%`
}
const mem = Variable('', {
  poll: [1000, asBashCommand(memCommand), formatMem],
})

const tempCommand = "sensors | grep CPUTIN | awk '{print $2}'"
const formatTemp = (/** @type {string} */ out) => {
  const value = Math.floor(+(out.replace("+", "").replace("°C", ""))).toString()
  return `${value}°C`
}
const temp = Variable('', {
  poll: [1000, asBashCommand(tempCommand), formatTemp],
})

const fanCommand = "sensors | grep fan2 | awk '{print $2}'"
const formatFan = (/** @type {string} */ out) => {
  const value = Math.floor(+(out.replace("RPM", "").trim())).toString()

  return value
}
const fan = Variable('', {
  poll: [1000, asBashCommand(fanCommand), formatFan],
})

const Center = () => Widget.Box({
  class_name: 'center',
  children: [
    Cpu(),
    Temp(),
    Fan(),
    Mem(),
    Time(),
    Disk(),
    Network(),
    Sound(),
    Mic(),
  ],
})

const Fan = () => Widget.CenterBox({
  class_name: 'fan',
  center_widget: Widget.Box({
    children: [
      Icon(""),
      Gap(),
      Widget.Label({
        hpack: 'center',
        label: fan.bind().as(value => value),
      }),
    ],
  })
})

const Temp = () => Widget.CenterBox({
  class_name: 'temp',
  center_widget: Widget.Box({
    children: [
      Icon(""),
      Gap(),
      Widget.Label({
        hpack: 'center',
        label: temp.bind().as(value => value),
      }),
    ]
  }),
})

const Disk = () => Widget.CenterBox({
  class_name: 'disk',
  center_widget: Widget.Box({
    children: [
      Widget.Label({
        hpack: 'center',
        label: disk.bind().as(value => value),
      }),
      Gap(),
      Icon("󰋊")
    ]
  }),
})

const Mem = () => Widget.CenterBox({
  class_name: 'mem',
  center_widget: Widget.Box({
    children: [
      Icon("󰒋"),
      Gap(),
      Widget.Label({
        hpack: 'center',
        label: mem.bind().as(value => value),
      }),
    ]
  }),
})

const Cpu = () => Widget.EventBox({
  on_primary_click: () => Utils.exec(`alacritty -e htop`),
  child: Widget.CenterBox({
    class_name: 'cpu',
    center_widget: Widget.Box({
      children: [
        Icon(""),
        Gap(),
        Widget.Label({
          hpack: 'center',
          label: cpu.bind().as(value => value),
        }),
      ]
    }),
  })
})

const Network = () => {
  let possibleIcons = ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]
  let icon = network.wifi.bind("strength").as(strength => {
    return possibleIcons[Math.floor((+strength) / 20)]
  });


  return Widget.EventBox({
    on_primary_click: () => Utils.exec(`alacritty -e nmtui`),
    child: Widget.CenterBox({
      class_name: 'network',
      center_widget: Widget.Box({
        children: [
          Widget.Label({
            hpack: 'center',
            label: network.wifi.bind("strength").as(strength => `${strength}%`),
          }),
          Gap(),
          Icon(icon),
        ],
      }),

    }),
  })
}


const Time = () => Widget.Box({
  class_name: 'clock',
  children: [
    Widget.Label({
      hpack: 'center',
      label: time.bind(),
    }),
  ],
})


const Audio = (/** @type {string} */ type, /** @type {string} */ icon) => Widget.EventBox({
  on_scroll_up: () => audio[type].volume = Math.min(1, audio[type].volume + 0.01),
  on_scroll_down: () => audio[type].volume = Math.max(0, audio[type].volume - 0.01),
  child: Widget.CenterBox({
    class_name: 'audio',
    center_widget: Widget.Box({
      children: [
        Widget.Label({
          hpack: 'center',
          label: audio[type].bind('volume').as(value => `${Math.floor(value * 100)}%`),
        }),
        Gap(),
        Icon(icon)
      ]
    }),
  })
})

const Sound = () => Audio('speaker', '󰕾');
const Mic = () => Audio('microphone', '');

export const TopBar = (/** @type {number} */ monitor) => Widget.Window({
  monitor,
  class_name: "top-bar",
  name: `bar${monitor}`,
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  child: Widget.CenterBox({
    start_widget: FocusedTitle(),
    center_widget: Center(),
    end_widget: Workspaces(),
  }),
})
