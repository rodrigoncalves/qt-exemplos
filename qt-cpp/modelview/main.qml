import QtQuick 2.2

import org.example 1.0

ListView {
    id: view
    anchors.fill: parent
    model: DataEntryModel {}
    delegate: ListDelegate {
        // use the defined model role "diplay"
        text: model.display
    }

    highlight: ListHighlight {}
}
