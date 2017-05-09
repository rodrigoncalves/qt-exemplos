#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtWidgets>

class MainWindow : public QMainWindow
{
public:
    MainWindow(QWidget* parent=0);
	~MainWindow();

public slots:
    void storeContents();

private:
    QPushButton *m_button;

};

#endif
