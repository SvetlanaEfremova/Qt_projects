#include "mainwindow.h"

#include <QApplication>
#include <QGraphicsScene>
#include <QGraphicsBlurEffect>
#include <QGraphicsPixmapItem>
#include <QDir>
#include <QPainter>
#include <QFileDialog>
#include <QVBoxLayout>
#include <QLabel>
#include <QPushButton>
#include <QSlider>

QImage blurredImage(QImage sourceImage, int blurRadius) {
    if (sourceImage.isNull())
        return QImage();
    QGraphicsScene scene;
    QGraphicsPixmapItem item;
    scene.addItem(&item);
    item.setPixmap(QPixmap::fromImage(sourceImage));
    QGraphicsBlurEffect blur;
    blur.setBlurRadius(blurRadius);
    item.setGraphicsEffect(&blur);
    QImage result(sourceImage.size(),QImage::Format_ARGB32);
    result.fill(Qt::transparent);
    QPainter painter(&result);
    scene.render(&painter,QRectF(),QRect(0,0,sourceImage.width(),sourceImage.height()));
    return result;
}

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QWidget window;
    QVBoxLayout layout(&window);
    QLabel imageLabel(&window);
    imageLabel.setFixedSize(1000,600);
    QSlider slider(Qt::Horizontal,&window);
    slider.setMinimum(0);
    slider.setMaximum(10);
    QPushButton openFileButton("select image",&window);
    QFont font = openFileButton.font();
    font.setPointSize(14);
    openFileButton.setFont(font);
    layout.addWidget(&imageLabel);
    layout.addWidget(&slider);
    layout.addWidget(&openFileButton);
    QImage sourceImage;
    QObject::connect(&openFileButton,&QPushButton::clicked, [&imageLabel,&sourceImage](){
        QString filename = QFileDialog::getOpenFileName(nullptr,"Open a .jpg image",QDir::currentPath(),"JPEG (*.jpg;*.jpeg;*.jpe;*.jfif)");
        sourceImage=QImage(filename);
        imageLabel.setPixmap(QPixmap::fromImage(sourceImage).scaled(imageLabel.width(),
            imageLabel.height(), Qt::KeepAspectRatio));
        imageLabel.setAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
    });
    QObject::connect(&slider,&QSlider::valueChanged,[&slider,&imageLabel,&sourceImage]() {
        if (!sourceImage.isNull()) {
        int newValue = slider.value();
        imageLabel.setPixmap(QPixmap::fromImage(blurredImage(sourceImage, newValue).scaled(imageLabel.width(),
            imageLabel.height(), Qt::KeepAspectRatio)));
        }
    });
    window.move(500,100);
    window.show();
    return a.exec();
}
