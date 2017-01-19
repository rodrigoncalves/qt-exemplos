// column.qml

import QtQuick 2.5

DarkSquare {
    id: root
    width: 240; height: 240

    // coloca os elementos dipostos em uma coluna
    Column {
        id: column
        anchors.centerIn: parent
        spacing: 8 // espaçamento entre os elementos
        RedSquare {}
        GreenSquare { width: 96 }
        RedSquare {}
    }
}
