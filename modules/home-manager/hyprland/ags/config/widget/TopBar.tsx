import app from "ags/gtk3/app"
import { Astal, Gtk, Gdk } from "ags/gtk3"
import { exec } from "ags/process"
import { createBinding, With } from "ags"
import { createPoll } from "ags/time"

import Hyprland from "gi://AstalHyprland"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"
import GLib from "gi://GLib"

const HOME = GLib.getenv("HOME")

const hyprland = Hyprland.get_default()
const hyprlandWorkspace = createBinding(hyprland, "focused_workspace")

const audio = Wp.get_default()?.audio
const audioSpeakerVolume = createBinding(audio!.default_speaker!, "volume")
const audioMicVolume = createBinding(audio!.default_microphone!, "volume")

const network = Network.get_default()
const networkWifiStrength = createBinding(network.wifi, "strength")
const networkState = createBinding(network, "state")
const networkPrimary = createBinding(network, "primary")

const time = createPoll("", 1000, "date")

const asBashCommand = (command: string) => ["bash", "-c", command]

const cpuCommand = "top -bn1 | grep Cpu | awk '{print $2 + $4}'"
const formatCpu = (out: string) => {
  const value = Math.floor(+out).toString()
  return `${value}%`
}
const cpu = createPoll("", 1000, asBashCommand(cpuCommand), formatCpu)

const diskCommand = "df / | grep / | awk '{print 0 + $5}'"
const formatDisk = (out: string) => {
  const value = Math.floor(+out).toString()
  return `${value}%`
}
const disk = createPoll("", 60000, asBashCommand(diskCommand), formatDisk)

const memCommand = "free | grep Mem | awk '{print 100 - ($7/$2 * 100)}'"
const formatMem = (out: string) => {
  const value = Math.floor(+out).toString()
  return `${value}%`
}
const mem = createPoll("", 1000, asBashCommand(memCommand), formatMem)

const tempCommand = "sensors | grep CPUTIN | awk '{print $2}'"
const formatTemp = (out: string) => {
  const value = Math.floor(+(out.replace("+", "").replace("°C", ""))).toString()
  return `${value}°C`
}
const temp = createPoll("", 1000, asBashCommand(tempCommand), formatTemp)


export default function TopBar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return <window
    class="top-bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | RIGHT}
    application={app}>

    <centerbox>
      <Title />
      <Center />
      <Workspaces />
    </centerbox>
  </window>
}



type IconProps = {
  children?: any
}

function Icon(props: IconProps) {
  return <label
    class="topbar-icon"
  >{props.children}</label>
}

function Title() {
  const clients = createBinding(hyprland, "clients")

  return <box>
    <With value={clients}>
      {clients => {
        if (clients.length === 0) {
          return <box />
        } else {
          return <FocusedTitle />
        }
      }}
    </With>
  </box>
}

function FocusedTitle() {
  const hyprlandClient = createBinding(hyprland, "focused_client")
  return <box>
    <With value={hyprlandClient}>
      {client =>
        <box
          class="window-title"
          visible={!!client?.title}>
          <label label={client?.title}></label>
        </box>
      }
    </With>
    <box />
  </box>
}

function Workspaces() {
  return <box
    halign={Gtk.Align.END}>
    <box />
    <box class="workspaces">
      {Array.from({ length: 5 }, (_, i) => i + 1).map(i =>
        <box class="workspace-label">
          <With value={hyprlandWorkspace}>
            {workspace =>
              <Icon>{workspace.id === i ? "" : ""}</Icon>
            }
          </With>
        </box>
      )}
    </box>
  </box>
}

function Time() {
  return <eventbox
    onClick={() => exec(`zen https://calendar.google.com`)}>
    <box class="clock">
      <With value={time}>
        {time =>
          <label
            halign={Gtk.Align.CENTER}
          >
            {time}
          </label>
        }
      </With>
    </box>
  </eventbox>
}

function Center() {
  return <box class="center">
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
    onScroll={(_, event) => changeSpeakerVolume(-event.delta_y)}
    onClick={() => exec(`pavucontrol`)}>
    <centerbox class="audio">
      <box />
      <With value={audioSpeakerVolume}>
        {value =>
          <box>
            <label>{`${Math.floor(value * 100)}%`}</label>
            <Gap />
            <Icon>󰕾</Icon>
          </box>
        }
      </With>
      <box />
    </centerbox>
  </eventbox>
}

function Gap() {
  return <box class="gap" />
}


function Mic() {
  return <eventbox
    onScroll={(_, event) => changeMicVolume(-event.delta_y)}
    onClick={() => exec(`pavucontrol`)}>
    <centerbox class="audio">
      <box />
      <With value={audioMicVolume}>
        {value =>
          <box>
            <label>{`${Math.floor(value * 100)}%`}</label>
            <Gap />
            <Icon></Icon>
          </box>
        }
      </With>
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
  return <centerbox class="temp">
    <box />
    <With value={temp}>
      {temp =>
        <box>
          <Icon></Icon>
          <Gap />
          <label>{temp}</label>
        </box>
      }
    </With>
    <box />
  </centerbox>
}

function Disk() {
  return <centerbox class="disk">
    <box />
    <With value={disk}>
      {disk =>
        <box>
          <Icon>󰋊</Icon>
          <Gap />
          <label>{disk}</label>
        </box>
      }
    </With>
    <box />
  </centerbox>
}

function Mem() {
  return <centerbox class="mem">
    <box />
    <With value={mem}>
      {mem =>
        <box>
          <Icon>󰒋</Icon>
          <Gap />
          <label>{mem}</label>
        </box>
      }
    </With>
    <box />
  </centerbox>
}

function Cpu() {
  return <eventbox
    onClick={() => exec(`ghostty -e htop`)}>
    <centerbox class="cpu">
      <box />
      <With value={cpu}>
        {cpu =>
          <box>
            <Icon></Icon>
            <Gap />
            <label>{cpu}</label>
          </box>
        }
      </With>
      <box />
    </centerbox>
  </eventbox>
}

type MultiIconProps = {
  icons: string[]
  value: number
}

function MultiIcon({ icons, value }: MultiIconProps) {
  const step = 100 / icons.length
  return <Icon>
    {icons[Math.min(icons.length - 1, Math.floor(value / step))]}
  </Icon>
}

function NetworkWidget() {
  return <With value={networkState}>
    {state =>
      <box>
        {state === Network.State.CONNECTED_GLOBAL
          ? <NetworkConnectedWidget />
          : <NetworkDisconnectedWidget />}
      </box>
    }
  </With>
}

function NetworkConnectedWidget() {
  return <With value={networkPrimary}>
    {primary =>
      <box>
        {primary === Network.Primary.WIFI
          ? <NetworkWifiWidget />
          : <NetworkWiredWidget />}
      </box>
    }
  </With>
}

function NetworkDisconnectedWidget() {
  return <eventbox
    onClick={() => exec(`ghostty -e nmtui`)}>
    <centerbox class="network">
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
    <centerbox class="network">
      <box />
      <Icon>󰈁</Icon>
      <box />
    </centerbox>
  </eventbox>
}

function NetworkWifiWidget() {
  return <eventbox
    onClick={() => exec(`ghostty -e nmtui`)}>
    <centerbox class="network">
      <box />
      <With value={networkWifiStrength}>
        {strength =>
          <box>
            <label>{`${strength}%`}</label>
            <Gap />
            <MultiIcon icons={["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]} value={strength} />
          </box>
        }
      </With>
      <box />
    </centerbox>
  </eventbox>
}

const weather = createPoll({
  temp: "",
  icon: ""
}, 900000, async (old) => {
  try {
    const key = exec(`cat ${HOME}/.config/.secret/openweather`).trim()
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=50.281760&lon=18.997510&appid=${key}&units=metric`
    const response = exec(`curl -s "${url}"`)

    const body = JSON.parse(response)

    const temp = body.main.temp
    const icon = body.weather[0].icon

    if (!temp || !icon) {
      return old
    }

    return {
      temp: Math.floor(Number(temp)).toString() + "°C",
      icon: mapWeatherIcon(icon)
    }
  } catch (e) {
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
    <centerbox class="weather">
      <box />
      <With value={weather}>
        {value =>
          <box>
            <label>{value.temp}</label>
            <Gap />
            <Icon>{value.icon}</Icon>
          </box>
        }
      </With>
      <box />
    </centerbox>
  </eventbox>
}
