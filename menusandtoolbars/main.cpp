#include "checkable.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Checkable window;
    window.resize(350, 200);
    window.setWindowTitle("Checkable menu");
    window.show();

    return app.exec();
}
