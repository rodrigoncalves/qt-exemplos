import QtQuick 2.5
import QtQuick.LocalStorage 2.0

// exemplo que faz um select simples em um banco
Item {

    // equivalente ao construtor de uma classe
    // executa ao terminar a renderização do componente
    Component.onCompleted: {
        /**
         *  object openDatabaseSync(
         *      string name,
         *      string version,
         *      string description,
         *      int estimated_size,
         *      jsobject callback(db))
         */
        var db = LocalStorage.openDatabaseSync("My example", "1.0", "Example Database", 10000);
        db.transaction(function(tx) {
            var result = tx.executeSql('select * from notes');
            for (var i=0; i<result.rows.length; i++) {
                print(result.rows[i].text);
            }
        });
    }
}
