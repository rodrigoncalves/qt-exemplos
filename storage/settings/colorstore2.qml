// colorstore.qml
import QtQuick 2.5
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0

/**
 * Um pequeno exemplo que aplica valor de uma cor ao retângulo.
 * Quando o usuário clica na janela uma nova cor randômica é gerada.
 * Ao reabrir a aplicação, deve-se aparecer a última cor, as mesmas
 * dimensões de tamanho e comprimento da janela e a mesma posição na tela.
 */

ApplicationWindow {
    visible: true
    width: 320; height: 240

    // executado ao clicar
    function storeSettings() {
        settings.color = root.color
    }

    Rectangle {
        id: root
        color: settings.color // pega a cor salva
        anchors.fill: parent

        Settings {
            id: settings
            // category: 'window'
            property alias x: root.x
            property alias y: root.y
            property alias width: root.width
            property alias height: root.height
            property color color: "black"
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                root.color = Qt.hsla(Math.random(), 0.5, 0.5, 1.0)
                storeSettings()
            }
        }
    }
}
