// QML types (Rectangle, Image, ...)
import QtQuick 2.0

Rectangle {
    id: page // id do objeto para ser posteriormente referenciado
    width: 320; height: 480
    color: "lightgray"
    border.width: 30
    border.color: "white"

    Text {
        id: helloText
        text: "Hello World!"
        y: 30 // posição do eixo y
        anchors.horizontalCenter: page.horizontalCenter // centralizado em relação ao page
        font.pointSize: 24 // tamanho da fonte
        font.bold: true // negrito
    }
}
