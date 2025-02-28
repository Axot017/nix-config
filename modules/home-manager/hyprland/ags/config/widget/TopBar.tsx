import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"
import { exec, bind } from "astal"

import Hyprland from "gi://AstalHyprland"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"


const hyprland = Hyprland.get_default()
const hyprlandWorkspace = bind(hyprland, "focused_workspace")
const hyprlandClient = bind(hyprland, "focused_client")

const wp = Wp.get_default()
const audioSpeaker = bind(wp!, "default_speaker")
const audioMic = bind(wp!, "default_microphone")

const network = Network.get_default()

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
    <Time />
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
    onScroll={(_, event) => event.direction === Gdk.ScrollDirection.UP ? increaseSpeakerVolume() : decreaseSpeakerVolume()}>
    <centerbox className="audio">
      <box />
      <box>
        <label>{audioSpeaker.as(value => `${Math.floor(value.volume * 100)}%`)}</label>
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
        <label>{audioMic.as(value => `${Math.floor(value.volume * 100)}%`)}</label>
        <Gap />
        <Icon></Icon>
      </box>
      <box />
    </centerbox>
  </eventbox>
}

function changeMicVolume(delta: number) {
  const mic = audio?.get_default_microphone()
  if (mic) {
    mic.volume = Math.min(1, Math.max(0, mic.volume + delta))
  }
}

function increaseSpeakerVolume() {
  const speaker = audio?.get_default_speaker()
  if (speaker) {
    speaker.volume = Math.min(1, speaker.volume + 0.01)
  }
}

function decreaseSpeakerVolume() {
  const speaker = audio?.get_default_speaker()
  if (speaker) {
    speaker.volume = Math.max(0, speaker.volume - 0.01)
  }
}

function increaseMicVolume() {
  const mic = audio?.get_default_microphone()
  if (mic) {
    mic.volume = Math.min(1, mic.volume + 0.01)
  }
}

function decreaseMicVolume() {
  const mic = audio?.get_default_microphone()
  if (mic) {
    mic.volume = Math.max(0, mic.volume - 0.01)
  }
}

