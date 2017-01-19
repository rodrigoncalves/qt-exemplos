import QtQuick 2.5

Square {
	id: root
	width: 240
	height: 240
	color: "#3c3c3c" // negro
    border.color: Qt.darker(color)
    border.width: 1

	// coloca os elementos dipostos em uma coluna
	Column {
		id: row
		anchors.centerIn: parent
		spacing: 8 // espaçamento entre os elementos
		Square { color: "#ea7025" } // laranja
		Square { color: "#67c111"; width: 96 } // verde
		Square { color: "#ea7025" } // laranja
	}
}
