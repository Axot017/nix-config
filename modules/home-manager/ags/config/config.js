import { TopBar } from "./topbar.js"
import { NotificationPopups } from "./notifications.js"

App.config({
  style: "./style.css",
  windows: [TopBar(0), NotificationPopups(0)],
})

export { }
