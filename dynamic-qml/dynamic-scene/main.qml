import QtQuick 2.5
import QtQuick.XmlListModel 2.0
import "create-object.js" as CreateObject

Item {
    id: root
    width: 1024
    height: 600

    ListModel {
        id: objectsModel
    }

    // cria ufo na tela
    function addUfo() {
        CreateObject.create("ufo.qml", root, itemAdded);
    }

    // cria foquete na tela
    function addRocket() {
        CreateObject.create("rocket.qml", root, itemAdded);
    }

    // adiciona um objeto à lista de objetos
    function itemAdded(obj, source) {
        objectsModel.append({"obj": obj, "source": source});
    }

    // apaga todos os objetos
    function clearItems() {
        while (objectsModel.count > 0) {
            objectsModel.get(0).obj.destroy();
            objectsModel.remove(0);
        }
    }

    // salva os objetos em XML
    function serialize() {
        var res = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<scene>\n";

        for (var ii=0; ii < objectsModel.count; ++ii) {
            var i = objectsModel.get(ii);
            res += "  <item>\n"
                 + "    <source>" + i.source + "</source>\n"
                 + "    <x>" + i.obj.x + "</x>\n"
                 + "    <y>" + i.obj.y + "</y>\n
                 + "  </item>\n"
        }

        res += "</scene>";

        return res;
    }

    // semelhante a um banco de dados
    // representa os dados que serão salvos em XML
    // source: o nome da imagem (png)
    // x e y: posição do objeto
    XmlListModel {
        id: xmlModel
        query: "/scene/item"
        XmlRole { name: "source"; query: "source/string()" }
        XmlRole { name: "x"; query: "x/string()" }
        XmlRole { name: "y"; query: "y/string()" }
    }

    // recria os objetos apagados
    function deserialize() {
        dsIndex = 0;
        CreateObject.create(xmlModel.get(dsIndex).source, root, dsItemAdded);
    }

    // recupera as informações dos objetos
    function dsItemAdded(obj, source) {
        itemAdded(obj, source);
        obj.x = xmlModel.get(dsIndex).x;
        obj.y = xmlModel.get(dsIndex).y;

        dsIndex++;

        if (dsIndex < xmlModel.count) {
            CreateObject.create(xmlModel.get(dsIndex).source, root, dsItemAdded);
        }
    }

    property int dsIndex;

    //------------------------------------//

    Column {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 10

        spacing: 10
        width: 100

        // UFO
        Image {
            anchors.left: parent.left
            source: "ufo.png"

            MouseArea {
                anchors.fill: parent
                onClicked: addUfo();
            }
        }

        // Rocket
        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "rocket.png"

            MouseArea {
                anchors.fill: parent
                onClicked: addRocket();
            }
        }

        // Clear
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter

            width: 100
            height: 40

            color: "green"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    xmlModel.xml = serialize();
                    clearItems();
                }
            }

            Text {
                anchors.centerIn: parent
                font.pixelSize: 15
                text: "Clear"
            }
        }

        // Deserialize
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter

            width: 100
            height: 40

            color: "yellow"

            MouseArea {
                anchors.fill: parent
                onClicked: deserialize();
            }

            Text {
                anchors.centerIn: parent
                font.pixelSize: 15
                text: "Deserialize"
            }
        }
    }
}
