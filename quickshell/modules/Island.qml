import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import qs

Hover {
    id: root

    property int normalWidth: 90
    property int normalHeight: 36

    width: isHovered ? 320 : normalWidth
    height: isHovered ? 135 : normalHeight

    anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
        topMargin: 15
    }

    Behavior on width {
        NumberAnimation {
            duration: 300
            easing.type: Easing.OutCubic
        }
    }

    Behavior on height {
        NumberAnimation {
            duration: 300
            easing.type: Easing.OutCubic
        }
    }

    RectangularShadow {
        anchors.fill: background
        radius: background.radius
        blur: 18
        spread: 2
        offset.x: 0
        offset.y: 4
        color: Qt.rgba(0, 0, 0, 0.45)
        cached: true
    }

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 20
        color: Colors.bg0
    }

    Text {
        anchors.centerIn: parent
        visible: root.height < 60
        opacity: visible ? 1 : 0
        color: Colors.fg
        font {
            family: "SF Pro Display"
            pixelSize: 15
            bold: true
        }
        text: Qt.formatDateTime(clockTimer.currentTime, "hh:mm")

        Behavior on opacity {
            NumberAnimation { duration: 150 }
        }
    }

    Item {
        anchors {
            fill: parent
            topMargin: 16
            bottomMargin: 16
            leftMargin: 24
            rightMargin: 24
        }

        visible: root.height > 60
        opacity: visible ? 1 : 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        Column {
            anchors.centerIn: parent
            spacing: 8

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: Qt.formatDateTime(clockTimer.currentTime, "hh:mm:ss")
                color: Colors.fg
                font {
                    family: "SF Pro Display"
                    pixelSize: 22
                    bold: true
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: {
                    const date = clockTimer.currentTime
                    const day = date.getDate()
                    let suffix = "th"

                    if (day % 100 < 11 || day % 100 > 13) {
                        switch (day % 10) {
                        case 1: suffix = "st"; break
                        case 2: suffix = "nd"; break
                        case 3: suffix = "rd"; break
                        }
                    }

                    return Qt.formatDateTime(date, "dddd")
                        + ", " + day + suffix
                        + ", " + Qt.formatDateTime(date, "yyyy")
                }

                color: Colors.grey2
                font {
                    family: "SF Pro Display"
                    pixelSize: 15
                }
            }
        }
    }

    Timer {
        id: clockTimer

        property date currentTime: new Date()

        interval: 1000
        running: true
        repeat: true

        onTriggered: currentTime = new Date()
    }
}