import QtQuick 2.0

Rectangle {
    color: "red"
    border.width: 8
    border.color: "black"


    DragMove{
        id:dm
        anchors.fill: parent
        anchors.margins: border.width
    }
    Connections{
        target:dm
        onOffsetMove:{
            x += dm.dx
            y += dm.dy
        }
    }

    DragResize{
        id:dr
        anchors.fill: parent

        pBorderWidth: border.width
        pWidth: width
        pHeight: height
    }
    Connections{
        target: dr
        onNewRectangle :{
            x += dr.dx
            y += dr.dy
            width += dr.dw
            height += dr.dh
        }
    }
}
