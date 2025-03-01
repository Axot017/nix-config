import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Binding, Variable } from "astal"
import { exec, bind } from "astal"

import Hyprland from "gi://AstalHyprland"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"


const hyprland = Hyprland.get_default()
const hyprlandWorkspace = bind(hyprland, "focused_workspace")
const hyprlandClient = bind(hyprland, "focused_client")

const audio = Wp.get_default()?.audio
const audioSpeakerVolume = bind(audio!.default_speaker!, "volume")
const audioMicVolume = bind(audio!.default_microphone!, "volume")

const network = Network.get_default()
const networkWifiStrength = bind(network.wifi, "strength")
const networkState = bind(network, "state")
const networkPrimary = bind(network, "primary")

const time = Variable("").poll(1000, "date")

const asBashCommand = (command: string) => ["bash", "-c", command]

const cpuCommand = "top -bn1 | grep Cpu | awk '{print $2 + $4}'"
const formatCpu = (out: string) => {
  const value = Math.floor(+out).toString()
  return `${value}%`
}
const cpu = Variable("").poll(1000, asBashCommand(cpuCommand), formatCpu)

const diskCommand = "df / | grep / | awk '{print 0 + $5}'"
const formatDisk = (out: string) => {
  const value = Math.floor(+out).toString()
  return `${value}%`
}
const disk = Variable("").poll(60000, asBashCommand(diskCommand), formatDisk)

const memCommand = "free | grep Mem | awk '{print 100 - ($7/$2 * 100)}'"
const formatMem = (out: string) => {
  const value = Math.floor(+out).toString()
  return `${value}%`
}
const mem = Variable("").poll(1000, asBashCommand(memCommand), formatMem)

const tempCommand = "sensors | grep CPUTIN | awk '{print $2}'"
const formatTemp = (out: string) => {
  const value = Math.floor(+(out.replace("+", "").replace("°C", ""))).toString()
  return `${value}°C`
}
const temp = Variable("").poll(1000, asBashCommand(tempCommand), formatTemp)


export default function TopBar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return <window
    className="top-bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | RIGHT}
    application={App}>
    <centerbox>
      <FocusedTitle />
      <Center />
      <Workspaces />
    </centerbox>
  </window>
}



type IconProps = {
  child?: JSX.Element
}

function Icon(props: IconProps) {
  return <label
    className="topbar-icon"
  >{props.child}</label>
}

function FocusedTitle() {
  return <box>
    <box
      className="window-title"
      visible={hyprlandClient.as(client => !!client)}>
      <label>{hyprlandClient.as(client => client.title)}</label>
    </box>
    <box />
  </box>
}

function Workspaces() {
  return <box
    halign={Gtk.Align.END}>
    <box />
    <box className="workspaces">
      {Array.from({ length: 5 }, (_, i) => i + 1).map(i =>
        <box className="workspace-label">
          <Icon>{hyprlandWorkspace.as(workspace => workspace.id === i ? "" : "")}</Icon>
        </box>
      )}
    </box>
  </box>
}

function Time() {
  return <eventbox
    onClick={() => exec(`zen https://calendar.google.com`)}>
    <box className="clock">
      <label
        halign={Gtk.Align.CENTER}
      >{time()}</label>
    </box>
  </eventbox>
}

// const Center = () => Widget.Box({
//   class_name: 'center',
//   children: [
//     Cpu(),
//     Temp(),
//     Mem(),
//     Disk(),
//     Time(),
//     Weather(),
//     Network(),
//     Sound(),
//     Mic(),
//   ],
// })

function Center() {
  return <box className="center">
    <Cpu />
    <Temp />
    <Mem />
    <Disk />
    <Time />
    <NetworkWidget />
    <Speaker />
    <Mic />
  </box>
  // return <box className="center">
  //   <Cpu />
  //   <Temp />
  //   <Mem />
  //   <Disk />
  //   <Time />
  //   <Weather />
  //   <Network />
  //   <Sound />
  //   <Speaker />
  //   <Mic />
  // </box>
}

function Speaker() {
  return <eventbox
    onScroll={(_, event) => changeSpeakerVolume(event.delta_y)}>
    <centerbox className="audio">
      <box />
      <box>
        <label>{audioSpeakerVolume.as(value => `${Math.floor(value * 100)}%`)}</label>
        <Gap />
        <Icon>󰕾</Icon>
      </box>
      <box />
    </centerbox>
  </eventbox>
}

function Gap() {
  return <box className="gap" />
}


function Mic() {
  return <eventbox
    onScroll={(_, event) => changeMicVolume(event.delta_y)}>
    <centerbox className="audio">
      <box />
      <box>
        <label>{audioMicVolume.as(value => `${Math.floor(value * 100)}%`)}</label>
        <Gap />
        <Icon></Icon>
      </box>
      <box />
    </centerbox>
  </eventbox>
}

function changeSpeakerVolume(delta: number) {
  const speaker = audio?.get_default_speaker()
  if (speaker) {
    speaker.volume = Math.min(1, Math.max(0, speaker.volume + (delta / 100)))
  }
}

function changeMicVolume(delta: number) {
  const mic = audio?.get_default_microphone()
  if (mic) {
    mic.volume = Math.min(1, Math.max(0, mic.volume + (delta / 100)))
  }
}

function Temp() {
  return <centerbox className="temp">
    <box />
    <box>
      <Icon></Icon>
      <Gap />
      <label>{temp()}</label>
    </box>
    <box />
  </centerbox>
}

function Disk() {
  return <centerbox className="disk">
    <box />
    <box>
      <Icon>󰋊</Icon>
      <Gap />
      <label>{disk()}</label>
    </box>
    <box />
  </centerbox>
}

function Mem() {
  return <centerbox className="mem">
    <box />
    <box>
      <Icon>󰒋</Icon>
      <Gap />
      <label>{mem()}</label>
    </box>
    <box />
  </centerbox>
}

function Cpu() {
  return <eventbox
    onClick={() => exec(`ghostty -e htop`)}>
    <centerbox className="cpu">
      <box />
      <box>
        <Icon></Icon>
        <Gap />
        <label>{cpu()}</label>
      </box>
      <box />
    </centerbox>
  </eventbox>
}

type MultiIconProps = {
  icons: string[]
  value: Binding<number>
}

function MultiIcon({ icons, value }: MultiIconProps) {
  const step = 100 / icons.length
  return <Icon>
    {value.as(value => icons[Math.min(icons.length - 1, Math.floor(value / step))])}
  </Icon>
}

function NetworkWidget() {
  return <box>
    {networkState.as(state => {
      if (state === Network.State.CONNECTED_GLOBAL) {
        return <NetworkConnectedWidget />
      } else {
        return <NetworkDisconnectedWidget />
      }
    })}
  </box>
}

function NetworkConnectedWidget() {
  return <box>
    {networkPrimary.as(primary => {
      if (primary === Network.Primary.WIFI) {
        return <NetworkWifiWidget />
      } else {
        return <NetworkWiredWidget />
      }

    })}
  </box>
}

function NetworkDisconnectedWidget() {
  return <eventbox
    onClick={() => exec(`ghostty -e nmtui`)}>
    <centerbox className="network">
      <box />
      <box>
        <Icon>󰤮</Icon>
      </box>
      <box />
    </centerbox>
  </eventbox>
}

function NetworkWiredWidget() {
  return <eventbox
    onClick={() => exec(`ghostty -e nmtui`)}>
    <centerbox className="network">
      <box />
      <Icon>󰈁</Icon>
      <box />
    </centerbox>
  </eventbox>
}

function NetworkWifiWidget() {
  return <eventbox
    onClick={() => exec(`ghostty -e nmtui`)}>
    <centerbox className="network">
      <box />
      <box>
        <label>{networkWifiStrength.as(strength => `${strength}%`)}</label>
        <Gap />
        <MultiIcon icons={["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]} value={networkWifiStrength} />
      </box>
      <box />
    </centerbox>
  </eventbox>
}

// const Network = () => {
//   let possibleIcons = ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]
//   let icon = network.wifi.bind("strength").as(strength => {
//     return possibleIcons[Math.floor((+strength) / 20)]
//   });
//
//
//   return Widget.EventBox({
//     on_primary_click: () => Utils.exec(`ghostty -e nmtui`),
//     child: Widget.CenterBox({
//       class_name: 'network',
//       center_widget: Widget.Box({
//         children: [
//           Widget.Label({
//             hpack: 'center',
//             label: network.wifi.bind("strength").as(strength => `${strength}%`),
//           }),
//           Gap(),
//           Icon(icon),
//         ],
//       }),
//
//     }),
//   })
// }
