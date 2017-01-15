import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true




    DragMove{
        id:dm
        anchors.fill: parent
        anchors.margins: 8
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

        pBorderWidth: 8
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
