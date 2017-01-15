import QtQuick 2.4

Rectangle {
    property alias mouseArea: mouseArea

    width: 800
    height: 600

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    MoveRect {
        x: 55
        y: 49
        width: 100
        height: 100
        radius: 1
        z: 1

    }

    Text {
        anchors.centerIn: parent
        text: "Hello World"
    }
}
