#ifndef CAPTURECAMERAVIDEO_H
#define CAPTURECAMERAVIDEO_H

#include <opencv2/opencv.hpp>
#include <QImage>
#include <QTimer>
#include <QThread>
class capture: public QObject
{
    Q_OBJECT
    cv::Mat frame;
    QString source;
    QThread *streamThread = new QThread;
public:
    capture(QString source1);
    ~capture();

public slots:
    void readFrames();
    void doneThread();
    void start();
    void setSource(QString source1);
signals:
    void frameChange(QImage );
};


#endif // CAPTURECAMERAVIDEO_H
