import app from "ags/gtk3/app"
import style from "./style.css"
import TopBar from "./widget/TopBar"

app.start({
  css: style,
  main() {
    app.get_monitors().map(TopBar)
  },
})
