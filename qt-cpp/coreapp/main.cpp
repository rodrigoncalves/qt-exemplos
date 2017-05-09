#include <QCoreApplication>
#include <QString>
#include <QFile>
#include <QDir>
#include <QTextStream>
#include <QDebug>

/**
 * Para compilar o projeto execute o comando:
 * 1. qmake && make
 */
int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    // prepara a mensagem
    QString message("Hello world!");

    // prepara um arquivo no diretório de usuário (home)
    QFile file(QDir::home().absoluteFilePath("out.txt"));

    qDebug() << "teste";

    // tenta abrir o arquivo em modo de escrita
    if (!file.open(QIODevice::WriteOnly)) {
        qWarning() << "Can not open file with write access";
        return -1;
    }

    // cria um stream com o arquivo
    QTextStream stream(&file);
    // escreve mensagem no arquivo através do text stream
    stream << message;

    // do not start the eventloop as this would wait for external IO
    app.exec();

    // não é necessário fechar o arquivo, isso é feito
    // automaticamente ao fim do escopo

    return 0;
}
