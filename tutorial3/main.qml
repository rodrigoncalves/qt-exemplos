/**
 * States and transitions
 */
import QtQuick 2.0

Rectangle {
    id: page
    width: 320; height: 480
    color: "lightgray"

    Text {
        id: helloText
        text: "Hello world!"
        y: 30
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 24; font.bold: true

        MouseArea { id: mouseArea; anchors.fill: parent }

        // Esse state é ativado quando o MouseArea
        // é pressionado e desativado quando solta
        states: State {
            name: "down"; when: mouseArea.pressed == true
            // modifica propriedades de um objeto
            PropertyChanges { target: helloText; y: 160; rotation: 180; color: "red" }
        }

        // transição para que o objeto não mude seu estado instantaneamente
        transitions: Transition {
            from: ""   // estado default
            to: "down" // estado "down" criado anteriormente

            // Faz a mesma animação mas de forma reversa
            // É equivalente a escrever duas transições separadas
            reversible: true

            // ParallelAnimation faz com que duas animações comecem ao mesmo tempo
            // Poderia usar SequentialAnimation para uma animação após a outra
            ParallelAnimation {
                NumberAnimation { properties: "y, rotation"; duration: 500; easing.type: Easing.InOutQuad; }
                ColorAnimation { duration: 500 }
            }
        }
    }

    Grid {
        id: colorPicker
        x: 4; anchors.bottom: page.bottom; anchors.bottomMargin: 4
        rows: 2; columns: 3; spacing: 3

        Cell { cellColor: "red";    onClicked: helloText.color = cellColor }
        Cell { cellColor: "green";  onClicked: helloText.color = cellColor }
        Cell { cellColor: "blue";   onClicked: helloText.color = cellColor }
        Cell { cellColor: "yellow"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "steelblue"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "black";  onClicked: helloText.color = cellColor }
    }
}
