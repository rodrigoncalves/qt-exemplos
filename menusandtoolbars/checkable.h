#pragma once

#include <QtWidgets/QMainWindow>
#include <QtWidgets/QApplication>

class Checkable : public QMainWindow {

    Q_OBJECT

public:
    Checkable(QWidget *parent = 0);

private slots:
    void toggleStatusbar();

private:
    QAction *viewst;
};
