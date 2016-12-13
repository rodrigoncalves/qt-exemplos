import QtQuick 2.5
import QtQuick.Controls 1.4

ApplicationWindow {

    width: 400
    height: 300
    title: "Number animation"

    Rectangle {
        x: 20
        y: 20
        width: 100; height: 100
        color: "forestgreen"

        NumberAnimation on x { to: 250; duration: 1000 }
    }
}
