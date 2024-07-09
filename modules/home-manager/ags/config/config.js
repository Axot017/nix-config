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

const disk = Variable('', {
  poll: [1000, ["bash", "-c", "df / | grep / | awk '{print 0 + $5}'"], out => out.toString().trim()],
})

const mem = Variable('', {
  poll: [1000, ["bash", "-c", "free | grep Mem | awk '{print 100 - ($7/$2 * 100)}'"], out => out.toString().trim()],
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
    center_widget: Time(),
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
