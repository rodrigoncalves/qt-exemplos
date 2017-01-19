// textintput1.qml

import QtQuick 2.5

Rectangle {
    width: 200
    height: 80
    color: "linen"

    TLineEdit {
        id: input1
        x: 8; y: 8
        width: 96; height: 20
        // o cursor aparece dentro dessa entrada
        focus: true
        text: "Text Input 1"
        // pressionar a tecla TAB muda o cursor para input2
        KeyNavigation.tab: input2
    }

    TLineEdit {
        id: input2
        x: 8; y: 36
        width: 96; height: 20
        text: "Text Input 2"
        // pressionar a tecla TAB muda o cursor para input1
        KeyNavigation.tab: input1
    }

}
