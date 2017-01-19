// row.qml

import QtQuick 2.5

BrightSquare {
    id: root
    width: 400; height: 120

    // cria uma linha
    Row {
        id: row
        anchors.centerIn: parent
        spacing: 20 // espaço entre os elementos
        BlueSquare {}
        GreenSquare {}
        RedSquare {}
    }
}
