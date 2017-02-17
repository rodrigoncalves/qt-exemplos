import QtQuick 2.5

Rectangle {
    width: 120
    height: 300

    // Cria um gradiente
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#f6f6f6" }
        GradientStop { position: 1.0; color: "#d7d7d7" }
    }

    ListView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: 50
        delegate: numberDelegate
        spacing: 5
        focus: true
    }

    Component {
        id: numberDelegate

        Rectangle {
            // visualização da criação e destruição de um item na lista
            Component.onCompleted: console.log(index + " completed")
            Component.onDestruction: console.log(index + " destroyed")

            // List.view é uma referência para os objetos mostrados na tela
            width: ListView.view.width
            height: 40

            // boleano que indica se o item é o item atual
            color: ListView.isCurrentItem ? "#157efb" : "#53d769"
            border.color: Qt.lighter(color, 1.1) // clarear

            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }
}
