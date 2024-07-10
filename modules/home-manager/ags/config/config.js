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
  return ` ${value}%`
}
const cpu = Variable('', {
  poll: [1000, asBashCommand(cpuCommand), formatCpu],
})

const diskCommand = "df / | grep / | awk '{print 0 + $5}'"
const formatDisk = (/** @type {string} */ out) => {
  const value = Math.floor(+out).toString()
  return `${value}% 󰋊`
}
const disk = Variable('', {
  poll: [1000, asBashCommand(diskCommand), formatDisk],
})

const memCommand = "free | grep Mem | awk '{print 100 - ($7/$2 * 100)}'"
const formatMem = (/** @type {string} */ out) => {
  const value = Math.floor(+out).toString()
  return `󰒋 ${value}%`
}
const mem = Variable('', {
  poll: [1000, asBashCommand(memCommand), formatMem],
})

const tempCommand = "sensors | grep CPUTIN | awk '{print $2}'"
const formatTemp = (/** @type {string} */ out) => {
  const value = out.replace("+", "")
  return ` ${value}`
}
const temp = Variable('', {
  poll: [1000, asBashCommand(tempCommand), formatTemp],
})

const Center = () => Widget.Box({
  class_name: 'center',
  children: [
    Cpu(),
    Temp(),
    Mem(),
    Time(),
    Disk(),
  ],
})

const Temp = () => Widget.Box({
  class_name: 'temp',
  children: [
    Widget.Label({
      hpack: 'center',
      label: temp.bind(),
    }),
  ],
})

const Disk = () => Widget.Box({
  class_name: 'disk',
  children: [
    Widget.Label({
      hpack: 'center',
      label: disk.bind(),
    }),
  ],
})

const Mem = () => Widget.Box({
  class_name: 'mem',
  children: [
    Widget.Label({
      hpack: 'center',
      label: mem.bind(),
    }),
  ],
})

const Cpu = () => Widget.Box({
  class_name: 'cpu',
  children: [
    Widget.Label({
      hpack: 'center',
      label: cpu.bind(),
    }),
  ],
})

const Time = () => Widget.Box({
  class_name: 'clock',
  children: [
    Widget.Label({
      hpack: 'center',
      label: time.bind(),
    }),
  ],
})

const Bar = (/** @type {number} */ monitor) => Widget.Window({
  monitor,
  class_name: "top-bar",
  name: `bar${monitor}`,
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  child: Widget.CenterBox({
    start_widget: Widget.Label({
      hpack: 'center',
      label: mem.bind(),
    }),
    center_widget: Center(),
    end_widget: Widget.Label({
      hpack: 'center',
      label: disk.bind(),
    }),
  }),
})

App.config({
  style: "./style.css",
  windows: [Bar(0)],
})
