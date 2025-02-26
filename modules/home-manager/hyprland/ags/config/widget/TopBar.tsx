import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"
import { exec, bind } from "astal"

import Hyprland from "gi://AstalHyprland"

const hyprland = Hyprland.get_default()

const hyprlandWorkspace = bind(hyprland, "focused_workspace")

const hyprlandClient = bind(hyprland, "focused_client")

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
      <Time />
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
  return <box
    className="window-title"
    visible={hyprlandClient.as(client => !!client)}>
    <label>{hyprlandClient.as(client => client.title)}</label>
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
