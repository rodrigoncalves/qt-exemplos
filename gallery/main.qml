import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0

ApplicationWindow {
    id: window
    width: 360
    height: 520
    visible: true
    title: "Galeria Qt"

    header: ToolBar {
        Material.foreground: "white"

        ToolButton {
            contentItem: Image {
                fillMode: Image.pad
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source: "qrc:/images/menu.png"
            }

            Menu {
                id: optionsMenu
                x: parent.width - width
                transformOrigin: Menu.TopRight

                MenuItem {
                    text: "Sobre"
//                    onTriggered: settingsPopup.open()
                }
            }
        }
    }

}
