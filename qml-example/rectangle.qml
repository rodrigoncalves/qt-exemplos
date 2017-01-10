import QtQuick 2.0

Rectangle {
    visible: true
    width: 500
    height: 500

    Rectangle {
        id: root
        width: parent.width / 2
        height: parent.width / 2
        color: "green"

        anchors.centerIn: parent
    }

    Rectangle {
        id: cat
        width: 50
        height: 50
        color: "red"
        radius: width / 2
        anchors.centerIn: root
    }

    Rectangle {
        id: bigred
        width: 100
        height: 50
        color: "red"
        anchors.top: root.top
        anchors.left: root.left
    }

    Rectangle {
        width: 50
        height: 50
        color: "blue"
        anchors.top: cat.bottom
        anchors.left: cat.right
    }
}
