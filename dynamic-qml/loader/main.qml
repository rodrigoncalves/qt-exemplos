/**
 * Até agora QML foi tratado como uma ferramenta de construção
 * de conjuntos estáticos de cenários e a navegação entre eles.
 * Trabalhando com QML e JavaScript é uma maneira mais dinâmica.
 * Componentes podem ser carregados e instanciados em tempo de
 * execução. UI podem ser criados dinamicamente e podem ser salvos
 * para posteriormente serem restaurados.
 */
import QtQuick 2.5

Rectangle {
    id: root
    width: 600
    height: 400

    property int speed: 0

    /**
     * A forma mais fácil de carregar diferentes partes de QML dinamicamente
     * é usando o elemento "Loader". Ele serve como um marcador de posição
     * (placeholder) para o item que está sendo carregado.
     */
    Loader {
        id: dialLoader

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: analogButton.top

        onLoaded: {
            binder.target = dialLoader.item;
        }
    }

    // Analog Button
    Rectangle {
        id: analogButton

        anchors.left: parent.left
        anchors.bottom: parent.bottom

        color: "gray"

        width: parent.width/2
        height: 100

        Text {
            anchors.centerIn: parent
            text: "Analog"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.state = "analog";
        }
    }

    // Digital Button
    Rectangle {
        id: digitalButton

        anchors.right: parent.right
        anchors.bottom: parent.bottom

        color: "gray"

        width: parent.width/2
        height: 100

        Text {
            anchors.centerIn: parent
            text: "Digital"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.state = "digital";
        }
    }

    Binding {
        id: binder

        property: "speed"
        value: speed
    }

    /**
     * Para carregar um elemento basta usar a propriedade "source"
     * ou "sourceComponent" que pertence ao "Loader".
     * Mas como essa propriedade depende do estado atual da aplicação
     * ela será modificada em "states" através de "PropertyChanges"
     */
    state: "analog"

    states: [
        State {
            name: "analog"
            PropertyChanges { target: analogButton; color: "green"; }
            PropertyChanges { target: dialLoader; source: "Analog.qml"; }
        },
        State {
            name: "digital"
            PropertyChanges { target: digitalButton; color: "green"; }
            PropertyChanges { target: dialLoader; source: "Digital.qml"; }
        }
    ]

    // Animação da velocidade
    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        NumberAnimation { target: root; property: "speed"; to: 145; easing.type: Easing.InOutQuad; duration: 4000; }
        NumberAnimation { target: root; property: "speed"; to: 10;  easing.type: Easing.InOutQuad; duration: 2000; }
    }
}
