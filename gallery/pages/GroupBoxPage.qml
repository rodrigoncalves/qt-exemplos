import QtQuick 2.6
import QtQuick.Controls 2.0

Pane {
    id: pane

    readonly property int itemWidth: Math.max(button.implicitWidth, Math.min(button.implicitHeight))

    Column {
        spacing: 40
        anchors.fill: parent

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Um GroupBox fornece um quadro, um título em cima dele e um grupo lógico de controles dentro desse quadro."
        }

        GroupBox {
            title: "Título"
            anchors.horizontalCenter: parent.horizontalCenter

            Column {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                width: itemWidth

                RadioButton {
                    text: "Primeiro"
                    checked: true
                    width: parent.width
                }
                RadioButton {
                    id: button
                    text: "Segundo"
                    width: parent.width
                }
                RadioButton {
                    text: "Terceiro"
                    width: parent.width
                    enabled: false
                }
            }
        }
    }
}
