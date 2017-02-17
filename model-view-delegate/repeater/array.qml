// array.qml

import QtQuick 2.5
import "../common"

Column {
	spacing: 2

	Repeater {
		// lista que vai ser iterada
		model: ["Enterprise", "Columbia", "Challenger", "Discovery", "Endeavour", "Atlantis"]

		// definido em "common"
        BlueBox {
            width: 200
            height: 32
            radius: 3

            // modelData: valor do item
            text: modelData + ' (' + index + ')'
        }
	}
}
