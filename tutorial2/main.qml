import QtQuick 2.0

Rectangle {
    id: page
    width: 320; height: 480
    color: "lightgray"

    Text {
        id: helloText
        text: "Hello World!"
        y: 30
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 24
        font.bold: true
    }

    // Grid posiciona os objetos filhos automaticamente numa formação de "grade"
    Grid {
        id: colorPicker
        x: 4
        anchors.bottom: page.bottom
        anchors.bottomMargin: 4
        rows: 2; columns: 3; spacing: 3

        // chamando o componente Cell diversas vezes
        Cell { cellColor: "red";    onClicked: helloText.color = cellColor }
        Cell { cellColor: "green";  onClicked: helloText.color = cellColor }
        Cell { cellColor: "blue";   onClicked: helloText.color = cellColor }
        Cell { cellColor: "yellow"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "steelblue"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "black";  onClicked: helloText.color = cellColor }
    }
}
