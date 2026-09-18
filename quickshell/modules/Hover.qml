import QtQuick

Item {
    id: root

    // ==============================
    // CONFIGURATION PROPERTIES
    // ==============================
    property real normalWidth: 170
    property real normalHeight: 45

    property real expandedWidth: 320
    property real expandedHeight: 140

    property int duration: 250
    property bool isHovered: mouseArea.containsMouse

    // Kích thước hiện tại sẽ tự động animate khi isHovered thay đổi
    width: isHovered ? expandedWidth : normalWidth
    height: isHovered ? expandedHeight : normalHeight

    Behavior on width {
        NumberAnimation {
            duration: root.duration
            easing.type: Easing.OutBack
            easing.overshoot: 1.2
        }
    }

    Behavior on height {
        NumberAnimation {
            duration: root.duration
            easing.type: Easing.OutBack
            easing.overshoot: 1.2
        }
    }

    // ==============================
    // INTERACTION AREA
    // ==============================
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}