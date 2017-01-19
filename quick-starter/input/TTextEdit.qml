// TTextEdit.qml

import QtQuick 2.5

FocusScope {
	width: 96; height: width
	Rectangle {
		anchors.fill: parent
		color: "lightsteelblue"
		border.color: "gray"
	}

	property alias text: input.text
	property alias input: input

	TextEdit {
		id: input
		anchors.fill: parent
		anchors.margins: 4
		focus: true
	}
}
