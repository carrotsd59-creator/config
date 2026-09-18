import QtQuick
import Quickshell
import QtQuick.Effects
import Quickshell.Wayland
import "./modules" as Modules
import "./ScreenCorners"

ShellRoot {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: reserve

            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 45
            color: "transparent"
            exclusionMode: ExclusionMode.Normal
            exclusiveZone: 45
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: overlay

            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 1000
            color: "transparent"
            exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            mask: Region {
                Region { item: mediaPill }
                Region { item: island }
                Region { item: statusPill }
            }

            ScreenCorners {}

            Modules.Island {
                id: island
            }

            Modules.MediaPill {
                id: mediaPill

                anchors {
                    top: island.top
                    right: island.left
                    rightMargin: 10
                }
            }

            Modules.StatusPill {
                id: statusPill

                anchors {
                    top: island.top
                    left: island.right
                    leftMargin: 9
                }
            }
        }
    }
}
