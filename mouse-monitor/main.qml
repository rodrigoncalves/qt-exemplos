import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 500
    height: 500
    id: root

    Row {
        id: tools

        Button {
            id: clear
            text: "Clear"
            onClicked: {
                canvas.clear()
            }

        }
        Button {
            id: save
            text: "Save"
            onClicked: {
                mouse.save()
            }
        }
    }

    Canvas {
        id: canvas
        anchors.top: tools.bottom
        width: parent.width
        height: parent.height
        property int lastX: 0
        property int lastY: 0

        function clear() {
            var ctx = getContext("2d")
            ctx.reset()
            canvas.requestPaint()
            mouse.clear()
        }

        onPaint: {
            // Do cool stuff
            var ctx = getContext("2d")
            ctx.lineWidth = 2
            ctx.strokeStyle = color.red

            ctx.beginPath()
            ctx.moveTo(lastX, lastY)
            lastX = area.mouseX
            lastY = area.mouseY
            ctx.lineTo(lastX, lastY)
            ctx.stroke()

            mouse.test()
            mouse.add(lastX, lastY)
            mouse.add(Qt.point(lastX, lastY))
        }

        MouseArea {
            id: area
            anchors.fill: parent
            onPressed: {
                canvas.lastX = mouseX
                canvas.lastY = mouseY
            }

            onPositionChanged: {
                canvas.requestPaint()
            }
        }
    }
}
