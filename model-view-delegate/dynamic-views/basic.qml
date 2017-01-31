import QtQuick 2.5
import "../common"

Background {
	width: 80
	height: 300

	// A utilização do "ListView" é semelhante ao "Repeater".
	// Caso a quantidade de elementos não caiba na tela, o ListView
	// mostra parte da lista. No entanto, o comportamento padrão do Qt
	// torna visível todos os elementos desnecessariamente. Para evitar isso,
	// deve-se habilitar o recurso de "recorte" (clip).
	ListView {
		anchors.fill: parent
		anchors.margins: 20

		clip: true // faz com que mostre apenas os elementos que estão na tela
		model: 100 // número de elementos
		delegate: numberDelegate
		spacing: 5 // espaço entre os elementos
	}

	Component {
		id: numberDelegate

		GreenBox {
			width: 40
			height: 40
			text: index
		}
	}
}
