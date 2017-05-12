import QtQuick 2.2

import org.example 1.0

ListView {
    id: view
    anchors.fill: parent
    model: RoleEntryModel {}
    focus: true

    delegate: ListDelegate {
    	text: 'hsv(' +
            Number(model.hue).toFixed(2) + ',' +
            Number(model.saturation).toFixed() + ',' +
            Number(model.brightness).toFixed() + ')'
        color: model.name
    }

    highlight: ListHighlight {}
}
