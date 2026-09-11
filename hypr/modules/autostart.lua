-- Autostart
hl.on("hyprland.start", function () 
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hyprctl setcursor macOS 24")
 end)
