TEMPLATE = app
TARGET = gallery
QT += quick quickcontrols2

SOURCES += main.cpp

OTHER_FILES += gallery.qml \
    pages/*.qml

RESOURCES += qml.qrc

target.path = .
INSTALLS += target
