#include <QtGui>
#include <QtQuick>

#include "notificationclient.h"

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);

    QQuickView view;

    NotificationClient *notificationClient = new NotificationClient(&view);
    view.engine()->rootContext()->setContextProperty(QLatin1String("notificationClient"),
                                                     notificationClient);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    view.show();

    return app.exec();
}
