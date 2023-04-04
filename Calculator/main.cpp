#include <QApplication>
#include "./ui_caller.h"
#include "caller_main_window.h"

int main(int argc, char *argv[]) {
    QApplication a(argc, argv);
    CallerMainWindow window(nullptr);
    Ui::MainWindow caller;
    caller.setupUi(&window);
    window.show();
    window.lineEdit = caller.lineEdit;
    window.lineEdit_2 = caller.lineEdit_2;
    window.lineEdit_3 = caller.lineEdit_3;
    return QApplication::exec();
}
