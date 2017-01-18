/**
 * Criando um componente "Cell".
 * Um componente QML é como uma caixa preta em que a interação é feita
 * através de properties, signals e functions e geralmente é definido
 * em um arquivo QML separado.
 * Por convenção, o componente começa com letra maiúscula.
 */

import QtQuick 2.0

// Item é o tipo de objeto mais básico em QML
Item {
    id: container
    width: 40; height: 25

    // declaração de uma propriedade que pode ser acessada de fora
    // é um alias para uma propriedade existente - cor do retângulo
    property alias cellColor: rectangle.color

    // equivalente à função
    signal clicked(color cellColor)

    // O componente Cell é basicamente um retângulo colorido
    Rectangle {
        id: rectangle
        border.color: "white"
        anchors.fill: parent
    }

    // Define a área clicável do objeto
    // que é o mesmo tamanho do pai
    MouseArea {
        anchors.fill: parent
        onClicked: container.clicked(container.cellColor)
    }
}
