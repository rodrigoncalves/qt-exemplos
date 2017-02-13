// colorstore.qml
import QtQuick 2.5
import Qt.labs.settings 1.0

/**
 * Um pequeno exemplo que aplica valor de uma cor ao retângulo.
 * Quando o usuário clica na janela uma nova cor randômica é gerada.
 * Ao reabrir a aplicação, deve-se aparecer a última cor, as mesmas
 * dimensões de tamanho e comprimento da janela e a mesma posição na tela
 */
Rectangle {
    id: root
    width: 320; height: 240
    color: "black" // default color (primeira cor a aparecer)

    Settings {
        id: settings
        property alias color: root.color // salva a cor toda vez que muda
    }

    MouseArea {
        anchors.fill: parent
        /*
            O método Qt.hsla() recebe como parâmetro:
            hue, saturation, lightness, alpha
            todos tem um range 0-1.

            Retorna um color

            Referência: http://doc.qt.io/qt-5/qml-qtqml-qt.html#hsla-method
        */
        onClicked: root.color = Qt.hsla(Math.random(), 0.5, 0.5, 1.0)
    }
}
