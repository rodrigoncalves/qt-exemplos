// model.qml

import QtQuick 2.5
import "../common"

Column {
    spacing: 2

    Repeater {

        // É comum que se tenha múltiplas informações por item de uma lista.
        // É onde que os "models" entram. Para isso, utiliza-se um "ListModel"
        // que simplesmente contém uma coleção  de "ListElement". Dentro de
        // cada elemento da lista, propriedades podem ser definidas e ficam
        // acessíveis por todo o escopo do "Repeater"
        model: ListModel {
            ListElement { name: "Mercury"; surfaceColor: "gray" }
            ListElement { name: "Venus"; surfaceColor: "yellow" }
            ListElement { name: "Earth"; surfaceColor: "blue" }
            ListElement { name: "Mars"; surfaceColor: "orange" }
            ListElement { name: "Jupiter"; surfaceColor: "orange" }
            ListElement { name: "Saturn"; surfaceColor: "yellow" }
            ListElement { name: "Uranus"; surfaceColor: "lightBlue" }
            ListElement { name: "Neptune"; surfaceColor: "lightBlue" }
        }

        BlueBox {
            width: 200; height: 32
            radius: 3
            text: name // propriedade de ListElement

            Box {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 4

                width: 20; height: width
                radius: width / 2 // fazer um círculo
                color: surfaceColor // propriedade de ListElement
            }
        }
    }
}
