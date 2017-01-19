// Button.qml

import QtQuick 2.5

// Criando um botão pegando um retângulo de base
Rectangle {
    id: root

    // para tornar label.text público (acessível externamente)
    // é preciso criar um alias desta propriedade
    property alias text: label.text
    signal clicked()

    width: 116; height: 26
    color: "lightsteelblue"
    border.color: "slategrey"

    Text {
        id: label
        anchors.centerIn: parent
        text: "Start"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }
}
