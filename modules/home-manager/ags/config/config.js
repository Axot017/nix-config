const time = Variable('', {
  poll: [1000, function() {
    let date = new Date()
    let day = date.getDay()
    let month = date.getMonth()
    let year = date.getFullYear()

    let hours = date.getHours()
    let minutes = date.getMinutes()

    return `${day}-${month}-${year} ${hours}:${minutes}`
  }],
})

const Time = () => Widget.Label({
  hpack: 'center',
  label: time.bind(),
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
      label: 'Welcome to AGS!',
    }),
    center_widget: Time(),
    end_widget: Widget.Label({
      hpack: 'center',
      label: time.bind(),
    }),
  }),
})

App.config({
  windows: [Bar(0)],
})
