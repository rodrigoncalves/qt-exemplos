// httprequest.qml
import QtQuick 2.5

Rectangle {
    width: 320
    height: 480

    ListView {
        id: view
        anchors.fill: parent

        // Mostra imagem e texto recebido pelo requisição JSON
        delegate: Thumbnail {
            width: view.width
            text: modelData.title
            iconSource: modelData.media.m
        }
    }

    function request() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                print('HEADERS_RECEIVED');
            } else if (xhr.readyState === XMLHttpRequest.DONE) {
                print('DONE');

                // "json" recebe o response
                var json = JSON.parse(xhr.responseText.toString());

                /**
                // imprime o json response da forma que ele veio
                print(JSON.stringify(json, null, 2));

                // o código abaixo imprime os valores do objeto json
                print(json.title);
                for (var i=0; i<json.items.length; i++) {
                    print(json.items[i].title)
                    print(json.items[i].media.m)
                }
                **/

                // atribui o array "json.items" ao ListView "view" para
                // posteriormente ser apresentado na tela através da iteração
                view.model = json.items
            }
        }
        xhr.open("GET", "http://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=munich");
        xhr.send();
    }

    // executado assim quando o objeto "Rectangle" for instanciado
    // semelhante ao construtor de um objeto em C++
    Component.onCompleted: {
        request()
    }

}
