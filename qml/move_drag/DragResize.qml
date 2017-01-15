import QtQuick 2.0

Item {
    property int pWidth: 0
    property int pHeight: 0
    property int pBorderWidth:0
    property string direction:""


    property int dx: 0
    property int dy: 0
    property int dw: 0
    property int dh: 0

    signal newRectangle()

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        property point pressedPt : "0,0"
        property point lastMovePt : "0,0"
        property int normalCursor : 0

        Component.onCompleted: {
            normalCursor = cursorShape
        }


        onPressed:{
            pressedPt = Qt.point(mouse.x,mouse.y)
            lastMovePt = pressedPt
            direction = getDirction(Qt.point(mouse.x,mouse.y))
            console.log(direction)
            mouse.accepted = direction != ""

        }

        onPositionChanged: {
            if(pressed)
            {
                var dPt = Qt.size(mouse.x - pressedPt.x,mouse.y - pressedPt.y)

                dx = dy = dw = dh = 0

                if(direction.indexOf("Left") >=0 )
                {
                    dx = mouse.x - pressedPt.x
                    dw = -dx
                }
                else if(direction.indexOf("Right")>=0)
                {
                    dw = mouse.x - lastMovePt.x
                }

                if(direction.indexOf("Top") >= 0)
                {
                    dy = mouse.y - pressedPt.y
                    dh = -dy
                }
                else if(direction.indexOf("Bottom") >= 0)
                {
                    dh = mouse.y - lastMovePt.y
                }

                if(dx || dy || dw || dh)
                    newRectangle()

                if(direction.indexOf("Right")>=0 || direction.indexOf("Bottom")>=0)
                    lastMovePt = Qt.point(mouse.x,mouse.y)
            }


            changeCursor(getDirction(Qt.point(mouse.x,mouse.y)))





        }

        function getDirction(pt){
            var ret = ""
            if(pt.x < pBorderWidth && pt.x >= 0)
                ret += "Left"
            else if(pt.x < pWidth && pt.x > pWidth - pBorderWidth)
                ret += "Right"

            if(pt.y < pBorderWidth && pt.y >= 0)
                ret += "Top"
            else if(pt.y < pHeight && pt.y > pHeight - pBorderWidth)
                ret += "Bottom"

            return ret
        }

        function changeCursor(direction){
            if(direction == "Left" || direction == "Right")
                cursorShape = Qt.SizeHorCursor
            else if(direction == "Top" || direction == "Bottom")
                cursorShape = Qt.SizeVerCursor
            else if(direction == "LeftTop" || direction == "RightBottom")
                cursorShape = Qt.SizeFDiagCursor
            else if(direction == "LeftBottom" || direction == "RightTop")
                cursorShape = Qt.SizeBDiagCursor
            else
                cursorShape = normalCursor

            console.log(normalCursor)
        }
    }

}
