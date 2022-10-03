#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "captureCameraVideo.h"
#include "imageProviderOpenCV.h"


int main(int argc, char *argv[])
{
    capture* video = new capture("0");
    imageProvider* VideoProvider(new imageProvider);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // setContextProperty is used to connect the object to qml | Note that the methods should be slot to be accesible from qml
    engine.rootContext()->setContextProperty("streamer", video);
    engine.rootContext()->setContextProperty("imageprovider", VideoProvider);

    // Image provider is linked to qml via addImageProvider
    engine.addImageProvider("imProvider", VideoProvider);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    engine.load(url);

    // Connect the frame update signal to updateFrame of image provider to invoke the method
    QObject::connect(video, &capture::frameChange, VideoProvider, &imageProvider::updateFrame);

    return app.exec();
}
