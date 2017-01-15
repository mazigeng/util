import QtQuick 2.0

Item {
    signal offsetMove(point offset)

    property int dx: 0
    property int dy: 0


    MouseArea {
        anchors.fill: parent
        property point pressedPt : Qt.point(0,0)

        onPressed:{
            pressedPt = Qt.point(mouse.x,mouse.y)
        }

        onPositionChanged: {

            if(pressed)
            {
                parent.dx = mouse.x - pressedPt.x
                parent.dy = mouse.y - pressedPt.y

                offsetMove(Qt.point(parent.dx,parent.dy))
            }
            mouse.accepted = false
        }

    }
}
