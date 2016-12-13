import QtQuick 2.5
import QtQuick.Controls 1.4

ApplicationWindow  {

    id: rootwin
    width: 300
    height: 200
    title: "Main window"

    Text {
        text: "Qt Quick"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 24; font.bold: true
    }

    Button {
        x: 120
        y: 20
        text: "Quit"
        onClicked: Qt.quit()
    }

    function onChecked(checked) {
        if (checked) {
            rootwin.title = "Checkbox"
        } else {
            rootwin.title = "Main window"
        }
    }

    CheckBox {
        x: 15
        y: 15
        text: "Show title"
        checked: false
        onClicked: rootwin.onChecked(checked)
    }
}
