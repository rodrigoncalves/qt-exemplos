import QtQuick 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    width: 400
    height: 300
    visible: true
    title: "Qt Application"


    GroupBox {
        title: "Tray Icon"

        GridLayout {
            flow: GridLayout.LeftToRight
//            flow: GridLayout.TopToBottom

            Label {
                text: "Icon:"
            }

            ComboBox {
                id: cBox4

                model: ListModel {
                    id: cbItems
                    ListElement { src: "images/bad.png"; text: "Bad" }
                    ListElement { src: "images/heart.png"; text: "Heart" }
                    ListElement { src: "images/trash.png"; text: "Trash" }
                }
                style: ComboBoxStyle {
                    id: comStyle

                    label: Item {
                        Image {
                            id: img
                            fillMode: Image.PreserveAspectFit
                            source: "images/heart.png"

                            anchors.right: lblText.left
                            anchors.rightMargin: 10
                            anchors.top: lblText.top
                            anchors.topMargin: 10
                            height: 40

                            Component.onCompleted: {
                                cBox4.currentIndexChanged.connect(changeImage)
                            }

                            function changeImage() {
                                img.source = cbItems.get(cBox4.currentIndex).src;
//                                img.height = cbItems.get(cBox4.currentIndex).imageHeight;
                            }
                        }

                        Text {
                            text: qsTr("Heart")
                        }

                    }
                }

            }

            CheckBox {
                text: "Show icon"
                checked: true
            }


        }

    }


}
