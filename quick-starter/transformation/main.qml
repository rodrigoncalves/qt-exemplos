import QtQuick 2.5

Item {
    id: root
    // largura baseada na imagem de fundo
    width: bg.width
    height: bg.height

    // imagem de fundo
    Image {
        id: bg
        source: "assets/background.png"
    }

    // Como a ordem dos elementos importa, mousearea deve vir antes
    // das imagens para que possa funcionar os eventos de mouse
    MouseArea {
        id: backgroundClicker

        anchors.fill: parent
        onClicked: {
            rocket1.x = 84
            rocket2.rotation = 0
            rocket3.rotation = 0
            rocket3.scale = 1.0
        }
    }

    ClickableImage {
        id: rocket1
        x: width; y: 68
        source: "assets/rocket.png"
        antialiasing: true
        onClicked: { x += 20 }
    }

    ClickableImage {
        id: rocket2
        x: (parent.width - width)/2; y: 68
        source: "assets/rocket.png"
        antialiasing: true
        onClicked: { rotation += 15 }
    }

    ClickableImage {
        id: rocket3
        x: (parent.width - width*2); y: 68
        source: "assets/rocket.png"
        antialiasing: true
        onClicked: {
            rotation += 15
            scale += 0.05
        }
    }

    function _text_transformed() {
        rocket1.x += 20
        rocket2.rotation = 15
        rocket3.scale = 1.2
        rocket3.rotation = -15
    }

    function _test_overlap() {
        rocket1.x += 40
        rocket2.rotation = 15
        rocket3.scale = 2.0
        rocket3.rotation = 45
    }
}
