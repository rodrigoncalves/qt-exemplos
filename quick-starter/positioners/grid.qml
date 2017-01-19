// grid.qml

import QtQuick 2.5

BrightSquare {
    id: root
    width: 160; height: 160

    // grade
    Grid {
        id: grid
        rows: 2
        columns: 2
        anchors.centerIn: parent
        spacing: 8

        RedSquare {}
        RedSquare {}
        RedSquare {}
        RedSquare {}
    }
}
