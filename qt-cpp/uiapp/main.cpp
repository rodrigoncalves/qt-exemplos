#include <QtCore>
#include <QtGui>
#include <QtWidgets>
#include "mainwindow.h"

int main(int argc, char** argv)
{
	// inicia a aplicação
    QApplication app(argc, argv);

     MainWindow window;
     window.resize(320, 240);
     window.setVisible(true);

    // executa o laço de evento
    return app.exec();
}
