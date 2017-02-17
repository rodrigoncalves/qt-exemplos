import QtQuick 2.5

Rectangle {
    id: container
    width: 600
    height: 400
    color: "white"

    Column {
        anchors.top: parent.top
        anchors.left: parent.left

        spacing: 20

        // Texto da esquerda
        Rectangle {
            width: 290
            height: 50

            color: "lightGray"

            MouseArea {
                anchors.fill: parent
                onClicked: container.state = "left"
            }

            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: container.state==="left"?"Active":"Inactive"
            }
        }

        // Botão da esquerda
        Rectangle {
            id: leftRectangle

            width: 290
            height: 200

            color: "green"

            MouseArea {
                id: leftMouseArea
                anchors.fill: parent
                onClicked: {
                    leftClickedAnimation.start();
                }
            }

            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                color: "white"
                text: "Click me!"
            }
        }

    }

    Column {
        anchors.top: parent.top
        anchors.right: parent.right

        spacing: 20

        // Texto da direita
        Rectangle {
            width: 290
            height: 50

            color: "lightGray"

            MouseArea {
                anchors.fill: parent
                onClicked: container.state = "right"
            }

            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: container.state==="right"?"Active":"Inactive"
            }
        }

        // Botão da direita
        Rectangle {
            id: rightRectangle

            width: 290
            height: 200

            color: "blue"

            MouseArea {
                id: rightMouseArea
                anchors.fill: parent
                onClicked: rightClickedAnimation.start();
            }

            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                color: "white"
                text: "Click me!"
            }
        }
    }

    // Texto embaixo
    Text {
        id: activeText

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50

        font.pixelSize: 30
        color: "red"
        text: "Active area clicked!"

        opacity: 0
    }

    // Animação do botão da esquerda
    SequentialAnimation {
        id: leftClickedAnimation

        PropertyAction {
            target: leftRectangle
            property: "color"
            value: "white"
        }
        ColorAnimation {
            target: leftRectangle
            property: "color"
            to: "green"
            duration: 3000
        }
    }

    // Animação do botão da direita
    SequentialAnimation {
        id: rightClickedAnimation

        PropertyAction {
            target: rightRectangle
            property: "color"
            value: "white"
        }
        ColorAnimation {
            target: rightRectangle
            property: "color"
            to: "blue"
            duration: 3000
        }
    }

    // Animação do texto de baixo
    SequentialAnimation {
        id: activeClickedAnimation

        PropertyAction {
            target: activeText
            property: "opacity"
            value: 1
        }
        PropertyAnimation {
            target: activeText
            property: "opacity"
            to: 0
            duration: 3000
        }
    }

    // se conecta ao botão da esquerda ou da direita dependendo
    // do estado da aplicação definida a seguir
    Connections {
        id: connections
        onClicked: activeClickedAnimation.start();
        // target: parent (default)

        // necessário para não tratar sinais vindos
        // de parent até que a propriedade seja definida
        target: null
    }

    // altera a propriedade "target" de "connections"
    // dependendo do estado "left" ou "right"
    states: [
        State {
            name: "left"
            // Não podemos usar "PropertyChanges" aqui
            // porque a propriedade "target" ainda não foi definida
            StateChangeScript {
                script: connections.target = leftMouseArea
            }
        },
        State {
            name: "right"
            StateChangeScript {
                script: connections.target = rightMouseArea
            }
        }
    ]

    Component.onCompleted: {
        state = "left"
    }

}
