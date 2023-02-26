hs.logger.defaultLogLevel="info"

hyper       = {"cmd","alt","ctrl"}
shift_hyper = {"cmd","alt","ctrl","shift"}
ctrl_cmd    = {"cmd","ctrl"}

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.zzspoons = {
  url = "https://github.com/zzamboni/zzSpoons",
  desc = "zzamboni's spoon repository",
}

spoon.SpoonInstall.use_syncinstall = true

Install=spoon.SpoonInstall


Install:andUse("WindowHalfsAndThirds",
               {
                 config = {
                   use_frame_correctness = true
                 },
                 hotkeys = 'default',
--                 loglevel = 'debug'
               }
)

myGrid = { w = 6, h = 4 }
Install:andUse("WindowGrid",
               {
                 config = { gridGeometries =
                              { { myGrid.w .."x" .. myGrid.h } } },
                 hotkeys = {show_grid = {hyper, "g"}},
                 start = true
               }
)

Install:andUse("WindowScreenLeftAndRight",
               {
                 config = {
                   animationDuration = 0
                 },
                 hotkeys = 'default',
--                 loglevel = 'debug'
               }
)

Install:andUse("Hammer",
               {
                 repo = 'zzspoons',
                 config = { auto_reload_config = false },
                 hotkeys = {
                   config_reload = {hyper, "r"},
                   toggle_console = {hyper, "y"}
                 },
--                 fn = BTT_restart_Hammerspoon,
                 start = true
               }
)

Install:andUse("TextClipboardHistory",
               {
                 config = {
                   show_in_menubar = false,
                 },
                 hotkeys = {
                   toggle_clipboard = { { "cmd", "shift" }, "v" } },
                 start = true,
               }
)


Install:andUse("Caffeine", {
                 start = true,
                 hotkeys = {
                   toggle = { hyper, "1" }
                 },
--                 fn = BTT_caffeine_widget,
})

Install:andUse("MouseCircle",
               {
                 config = {
                   color = hs.drawing.color.x11.rebeccapurple
                 },
                 hotkeys = {
                   show = { hyper, "s" }
                 }
               }
)

Install:andUse("MicMute",
               {
                   hotkeys = {
                     toggle = { hyper, "m" }
                   }
               }
)

hs.notify.show("Welcome to Hammerspoon", "Have fun!", "")
