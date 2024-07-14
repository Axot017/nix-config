import { TopBar } from "./topbar.js"
import { NotificationPopups } from "./notifications.js"
import { AppLauncher } from "./applauncher.js"

App.config({
  style: "./style.css",
  windows: [TopBar(0), NotificationPopups(0), AppLauncher()],
})

export { }
