import { App } from "astal/gtk3"
import style from "./style.css"
import TopBar from "./widget/TopBar"

App.start({
  css: style,
  main() {
    App.get_monitors().map(TopBar)
  },
})
