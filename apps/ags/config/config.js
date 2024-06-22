import { Bar } from "./bar.js";
import { Applauncher } from "./applauncher.js"
import { NotificationPopups } from "./notificationPopups.js";

App.config({
    style: "./style.css",
    windows: [
        Bar(0), Bar(1),
        Applauncher,
        NotificationPopups(1)
    ],
})

export { }