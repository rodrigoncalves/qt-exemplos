// flow.qml

import QtQuick 2.5

BrightSquare {
    id: root
    width: 160; height: 160

    // Flow coloca os elementos em linhas e/ou colunas
    // de modo que caiba na tela
    Flow {
    	anchors.fill: parent
    	anchors.margins: 20
    	spacing: 20

    	RedSquare {}
    	BlueSquare {}
    	GreenSquare {}
    }
}
