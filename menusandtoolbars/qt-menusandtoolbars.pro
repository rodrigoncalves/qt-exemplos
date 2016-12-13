TEMPLATE = app

QT += widgets
CONFIG += c++11

SOURCES += main.cpp \
    simplemenu.cpp \
    anothermenu.cpp \
    checkable.cpp

RESOURCES +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    simplemenu.h \
    anothermenu.h \
    checkable.h
