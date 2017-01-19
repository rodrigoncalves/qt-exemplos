// row.qml


import QtQuick 2.5

Square {
    width: 400; height: 120
    color: "#f0f0f0" // cinza claro
    border.color: Qt.lighter(color) // dá uma clareada

    // cria uma linha
    Row {
        id: row
        anchors.centerIn: parent
        spacing: 20 // espaço entre os elementos
        Square { color: "#00bde3" } // azul
        Square { color: "#67c111" } // verde
        Square { color: "#ea7025" } // vermelho
    }

}
