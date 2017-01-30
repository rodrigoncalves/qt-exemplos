/**
 * A seguir será demonstrado um CRUD simples através de REST client.
 * O grid apresenta as cores que foram recebidas via HTTP.
 * É necessário rodar um servidor local para funcionar (colorservice.js)
 */

Rectangle {
	width: 480
	height: 320
	color: "black"

	ListModel {
		id: gridModel
	}

	StatusLabel {
		id: message
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.right: parent.right
	}

	GridView {
		id: view
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.margins: 8
		model: gridModel
		cellWidth: 64; cellHeight: 64
		delegate: Rectangle {
			widht: 64; height: 64
			color: model.value
		}
	}

	Column {
		id: sideBar
		widht: 160
	}
}
