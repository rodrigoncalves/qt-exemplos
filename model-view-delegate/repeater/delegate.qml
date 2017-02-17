// delegate.qml

import QtQuick 2.5
import "../common"

Column {
	spacing: 2

	Repeater {
		model: ["Enterprise", "Columbia", "Challenger", "Discovery", "Endeavour", "Atlantis"]

		// A única diferença para o array.qml é que
		// existe a propriedade "delegate" de "Repeater"
		delegate: BlueBox {
			width: 200
			height: 32
			radius: 3
            text: modelData + ' (' + index + ')'
		}
	}
}
