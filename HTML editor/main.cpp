#include "mainwindow.h"

#include <QApplication>
#include <QHBoxLayout>
#include <QPlainTextEdit>
#include <QWebEngineView>
#include <QSizePolicy>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QWidget window;
    QHBoxLayout layout(&window);
    QPlainTextEdit textEditor(nullptr);
    QWebEngineView webView(nullptr);
    window.setWindowTitle("HTML editor");
    layout.addWidget(&textEditor);
    layout.addWidget(&webView);
    textEditor.setMinimumSize(500,600);
    webView.setMinimumSize(500,600);
    window.move(500,200);
    textEditor.setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Expanding);
    webView.setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Expanding);
    QObject::connect(&textEditor,&QPlainTextEdit::textChanged,[&textEditor,&webView](){
        webView.setHtml(textEditor.toPlainText());
    });
    window.show();
    return a.exec();
}
