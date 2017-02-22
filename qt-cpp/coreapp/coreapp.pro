# tipo do programa (lib, app)
TEMPLATE = app

# usa o módulo "core" e não usa o módulo "gui" de interface gráfica
QT += core
QT -= gui

# nome do executável
TARGET = CoreApp

# permite saída no console
CONFIG += console

# para mac remove o "bundling" da aplicação
macx {
    CONFIG -= app_bundle
}

# arquivos de código fonte
SOURCES += main.cpp
