import QtQuick 2.0

Rectangle {
    id: label

    width: 200
    height: 300

    Button {
        id: button
        x: 12; y: 12
        text: "Start"
        onClicked: {
            status.text = "Button clicked!"
        }
    }

    Text {
        id: status
        x: 12; y: 76
        width: 116; height: 26
        text: "Waiting..."
        horizontalAlignment: Text.AlignHCenter
    }
}
