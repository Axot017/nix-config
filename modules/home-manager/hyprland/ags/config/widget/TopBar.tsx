import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"
import { exec } from "astal"

const time = Variable("").poll(1000, "date")

export default function TopBar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return <window
    className="top-bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | RIGHT}
    application={App}>
    <centerbox>
      <Time />
    </centerbox>
  </window>
}


// const Time = () => Widget.EventBox({
//   on_primary_click: () => Utils.exec(`brave https://calendar.google.com`),
//   child: Widget.Box({
//     class_name: 'clock',
//     children: [
//       Widget.Label({
//         hpack: 'center',
//         label: time.bind(),
//       }),
//     ],
//   })
// })
//
function Time() {
  return <eventbox
    on_primary_click={() => exec(`brave https://calendar.google.com`)}>
    <box className="clock">
      <label
        halign={Gtk.Align.CENTER}
      >{time()}</label>
    </box>
  </eventbox>
}
