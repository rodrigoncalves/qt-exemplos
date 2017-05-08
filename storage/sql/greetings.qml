import QtQuick 2.0
import QtQuick.LocalStorage 2.0

Rectangle {
	width: 200
	height: 100

	Text {
		text: "?"
		anchors.horizontalCenter: parent.horizontalCenter

		function findGreetings() {
			var db = LocalStorage.openDatabaseSync("QQmlExampleDB", "1.0", "The Example QML SQL!", 1000000);
			db.transaction(
				function(tx) {
					// cria o banco de dados caso não exista
					tx.executeSql('CREATE TABLE IF NOT EXISTS Greeting(salutation TEXT, salutee TEXT)');

					// adicionar (outra) linha de 'saudação'
					tx.executeSql('INSERT INTO Greeting VALUES(?, ?)', ['hello', 'world']);
					tx.executeSql('INSERT INTO Greeting VALUES(?, ?)', ['hi', 'man']);

					// apresentar todas as saudações adicionadas
					var rs = tx.executeSql('SELECT * FROM Greeting');
					var r = ""
					for (var i=0; i < rs.rows.length; i++) {
						r += rs.rows.item(i).salutation + ", " + rs.rows.item(i).salutee + "\n"
					}
					text = r

					// tx.executeSql('DELETE FROM Greeting');
				}
			)
		}

		Component.onCompleted: findGreetings()
	}
}
