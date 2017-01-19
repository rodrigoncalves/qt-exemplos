// repeater.qml

import QtQuick 2.5

DarkSquare {
    id: root
    width: 252
    height: 252

    // blue, green, red
    property variant colorArray: ["#00bde3", "#67c111", "#ea7025"]

    Grid {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 4

        // funciona como um for-loop
        Repeater {
            model: 16 // número de iterações
            Rectangle {
                width: 56; height: 56
                property int colorIndex: Math.floor(Math.random()*3)
                color: root.colorArray[colorIndex]
                border.color: Qt.lighter(color)
                Text {
                    anchors.centerIn: parent
                    color: "#f0f0f0"

                    // Repeater adiciona a propriedade "index"
                    // dentro do loop (
                    text: "Cell " + index
                }
            }
        }
    }

}