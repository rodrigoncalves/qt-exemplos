// ClickableImage.qml
// Uma simples imagem que pode ser clicada

import QtQuick 2.5

Image {
	id: root
	signal clicked

	MouseArea {
		anchors.fill: parent
		onClicked: root.clicked()
	}
}
