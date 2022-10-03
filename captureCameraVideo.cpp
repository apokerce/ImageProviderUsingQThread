#include "captureCameraVideo.h"


capture::capture(QString source1)
{
    source = source1;
}

capture::~capture()
{
    std::cout << "Capture destroyed" << std::endl;
    delete streamThread;
}

void capture::doneThread()
{
    // Request an interrupt to escape from while loop
    streamThread->requestInterruption();
    streamThread->quit();  // Send quit request to thread
    streamThread->wait();  // Wait for thread to quit

}

void capture::start()
{
    // Start thread
    QObject::connect(streamThread, &QThread::started, this, &capture::readFrames);
    this->moveToThread(streamThread);
    streamThread->start();
}

void capture::setSource(QString source1)
{
    source = source1;
}


void capture::readFrames()
{

    if(source.isEmpty())
        return;
    cv::VideoCapture cap;
    std::string x = source.toStdString();
    if(source.length() == 1)
        cap.open(int(x[0])-48);
    else
        cap.open(x);
    if(!cap.isOpened())
        std::cerr << "Unable to open source: " << x<<std::endl;


    while(true)
    {
        cap.read(frame);
        if(frame.empty())
        {    std::cerr << "Unable to read frame "<<std::endl; break;}
        // Invoke the signal so that connected classes know frame changed
        QImage frameUp = QImage(frame.data,frame.cols,frame.rows,QImage::Format_RGB888).rgbSwapped();
        emit frameChange(frameUp);

        // If interrupt request come return from the function
        // If one does not break the loop the thread will not terminate
        if(QThread::currentThread()->isInterruptionRequested())
        {
            cap.release();
             std::cout << "quit1"<<std::endl;
            return;
        }

    }

}
