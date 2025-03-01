import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Binding, Variable } from "astal"
import { exec, bind, readFileAsync } from "astal"

import Hyprland from "gi://AstalHyprland"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"
import GLib from "gi://GLib"

const HOME = GLib.getenv("HOME")


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

function Center() {
  return <box className="center">
    <Cpu />
    <Temp />
    <Mem />
    <Disk />
    <Time />
    <Weather />
    <NetworkWidget />
    <Speaker />
    <Mic />
  </box>
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

const weather = Variable({
  temp: "",
  icon: ""
}).poll(10000, async (old) => {
  try {
    const key = exec(`cat ${HOME}/.config/.secret/openweather`).trim()
    console.log("KEY", key)
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=50.281760&lon=18.997510&appid=${key}&units=metric`
    const stdout = exec(`curl -s "${url}" | jq -r '.main.temp, .weather[0].icon'`)
    console.log("STDOUT", stdout)
    const [temp, icon] = stdout.trim().split('\n')

    console.log("TEMP", temp)
    console.log("ICON", icon)

    if (!temp || !icon) {
      return old
    }

    return {
      temp: Math.floor(Number(temp)).toString() + "°C",
      icon: mapWeatherIcon(icon)
    }
  } catch (e) {
    console.log("ERROR", e)
    return old
  }
})

const mapWeatherIcon = (icon: string) => {
  switch (icon) {
    case "01d":
      return "󰖙"
    case "01n":
      return "󰖙"
    case "02d":
      return "󰖕"
    case "02n":
      return "󰖕"
    case "03d":
      return "󰖐"
    case "03n":
      return "󰖐"
    case "04d":
      return "󰖐"
    case "04n":
      return "󰖐"
    case "09d":
      return "󰖗"
    case "09n":
      return "󰖗"
    case "10d":
      return "󰼳"
    case "10n":
      return "󰼳"
    case "11d":
      return "󰙾"
    case "11n":
      return "󰙾"
    case "13d":
      return "󰖘"
    case "13n":
      return "󰖘"
    case "50d":
      return "󰖑"
    case "50n":
      return "󰖑"
    default:
      return ""
  }
};

function Weather() {
  return <eventbox
    onClick={() => exec(`zen https://openweathermap.org/city/3096472`)}>
    <centerbox className="weather">
      <box />
      <box>
        <label>{weather().as(value => value.temp)}</label>
        <Gap />
        <Icon>{weather().as(value => value.icon)}</Icon>
      </box>
      <box />
    </centerbox>
  </eventbox>
}
