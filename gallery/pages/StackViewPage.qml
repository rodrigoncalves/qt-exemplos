
import QtQuick 2.6
import QtQuick.Controls 2.0

StackView {
    id: stackView
    initialItem: page

    Component {
        id: page

        Pane {
            id: pane
            width: parent ? parent.width : 0 // TODO: fix null parent on destruction

            Column {
                spacing: 40
                width: parent.width

                Label {
                    width: parent.width
                    wrapMode: Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "O StackView fornece um modelo de navegação baseado em pilha que pode ser usado com um conjunto de páginas"
                    + " interligadas. Itens são empurrados para a pilha à medida que o usuário navega mais fundo no material e"
                    + " remove da pilha quando ele escolhe voltar."
                }

                Button {
                    id: button
                    text: "Push"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 2, pane.availableWidth / 3))
                    onClicked: stackView.push(page)
                }

                Button {
                    text: "Pop"
                    enabled: stackView.depth > 1
                    width: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 2, pane.availableWidth / 3))
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: stackView.pop()
                }
            }
        }
    }
}
