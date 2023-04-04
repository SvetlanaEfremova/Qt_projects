//
// Created by Svetlana on 27.01.2023.
//

#ifndef TASK_37_4_1_NEW_CALLER_MAIN_WINDOW_H
#define TASK_37_4_1_NEW_CALLER_MAIN_WINDOW_H

#include <QMainWindow>
#include <QtWidgets/QLineEdit>
class CallerMainWindow : public QMainWindow {
    Q_OBJECT
public:
    QLineEdit* lineEdit = nullptr;
    QLineEdit* lineEdit_2 = nullptr;
    QLineEdit* lineEdit_3 = nullptr;
    CallerMainWindow(QWidget* parent = nullptr) : QMainWindow(parent) {}

public slots:
    void sum() {
        double sum = lineEdit->text().toDouble() + lineEdit_2->text().toDouble();
        lineEdit_3->setText(QString::number(sum));
    };
    void subtract() {
        double diff = lineEdit->text().toDouble() - lineEdit_2->text().toDouble();
        lineEdit_3->setText(QString::number(diff));
    };
    void multiply() {
        double product = lineEdit->text().toDouble() * lineEdit_2->text().toDouble();
        lineEdit_3->setText(QString::number(product));
    };
    void divide() {
        if (lineEdit_2->text().toDouble() == 0)
            lineEdit_3->setText("Error");
        else {
        double result = lineEdit->text().toDouble() / lineEdit_2->text().toDouble();
        lineEdit_3->setText(QString::number(result));
        }
    }
};

#endif //TASK_37_4_1_NEW_CALLER_MAIN_WINDOW_H
