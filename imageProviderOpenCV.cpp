#include "imageProviderOpenCV.h"

QImage imageProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    Q_UNUSED(id);
    // According to documentation provided by Qt, size should be set to original image size in all cases.
    // It sets the width and height of the requested image
    if(size)
       *size = QSize(width, height);
    // Scale requested image to requested size
    if(requestedSize.width() > 0 && requestedSize.height()>0)
          image = image.scaled(requestedSize.width(), requestedSize.height(), Qt::KeepAspectRatio);
    return image;
}

void imageProvider::updateFrame(const QImage& newFrame)
{
    // Set the image to new frame and invoke the signal
    if(newFrame != image && !newFrame.isNull() )
    {
        this->image = newFrame;
        emit frameUpdated1();
    }
}
