import QtQuick 2.5
import QtQuick.LocalStorage 2.0

Item {
    width: 400; height: 400

    // referência para o banco de dados
    property var db;

    Rectangle {
        id: crazy
        objectName: 'crazy'
        width: 100; height: 100
        x: 50; y: 50
        color: "#53d769"
        border.color: Qt.lighter(color, 1.1)

        Text {
            anchors.centerIn: parent
            text: Math.round(parent.x) + '/' + Math.round(parent.y)
        }

        MouseArea {
            anchors.fill: parent
            drag.target: parent // permite arrastar e soltar
        }
    }

    // inicializa o banco
    function initDatabase() {
        print('initDatabase()');
        db = LocalStorage.openDatabaseSync("CrazyBox", "1.0", "A box who remembers its position", 100000);
        db.transaction(function(tx) {
            print('... create table');
            tx.executeSql('CREATE TABLE IF NOT EXISTS data(name TEXT, value TEXT)');
        });
    }

    // busca dados do banco
    function readData() {
        print('readData()')
        if (!db) { return; }

        db.transaction(function(tx) {
            print('... read crazy object');
            var result = tx.executeSql('SELECT * FROM data WHERE name="crazy"');
            if (result.rows.length === 1) {
                print('... update crazy geometry');
                // recuperar o valor da coluna
                var value = result.rows[0].value;
                // converter para json object
                var obj = JSON.parse(value);
                crazy.x = obj.x
                crazy.y = obj.y
            }
        })
    }

    // salva dados no banco
    function storeData() {
        print('storeData()')
        if (!db) { return; }

        db.transaction(function(tx) {
            print('... check if a crazy object exists');
            var result = tx.executeSql('SELECT * FROM data WHERE name="crazy"');
            // preparar objeto para armazenar como json no banco
            var obj = { x: crazy.x, y: crazy.y };

            if (result.rows.length === 1) { // use UPDATE
                print('... crazy exists, update it');
                result = tx.executeSql('UPDATE data SET value=? WHERE name="crazy"',
                    [JSON.stringify(obj)]);
            } else { // use INSERT
                print('... crazy does not exists, create it');
                result = tx.executeSql('INSERT INTO data VALUES (?,?)',
                    ['crazy', JSON.stringify(obj)]);
            }
        });
    }

    // executa quando abre
    Component.onCompleted: {
        initDatabase();
        readData();
    }

    // executa quando fecha
    Component.onDestruction: {
        storeData();
    }

}
