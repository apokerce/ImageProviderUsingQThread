#ifndef IMAGEPROVIDEROPENCV_H
#define IMAGEPROVIDEROPENCV_H
#include <QQuickImageProvider>
#include <QImage>
#include <QObject>

                      // QObject should be inherited so that we can use the Qt meta-object system
class imageProvider :  public QObject, public QQuickImageProvider
{
    Q_OBJECT
    public:
        imageProvider(QObject *parent = nullptr) : QObject(parent), QQuickImageProvider(QQuickImageProvider::Image) {}
        QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize);

    // In qt slots are used so that the method of the class can be invoked from another class by providing connections via a signal
    public slots:
        void updateFrame(const QImage& newFrame);
// Signals are used to invoke qml functions or class functions via connections
signals:
    void frameUpdated1();

private:
    // Classes that contain slot or signals should mention Q_OBJECT to uses services provided by Qt's meta-object system

    QImage image;
    int width = 100, height = 100;

};



#endif // IMAGEPROVIDEROPENCV_H
