import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
ApplicationWindow
{
    id: mainScreen
    visible: true

    width: 530
    height: 530
    title: qsTr("Qt to Qml Image Provider Example")
    minimumHeight: 530
    minimumWidth: 530
    color: "white"
    Rectangle{
        id: imagerect
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: mainScreen.width - 130
        height:mainScreen.height - 130
        border.color: "black"
        border.width: 2
        Image{
            id: improvid
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: "image://imProvider/image"
            asynchronous: false
            cache: false

            property bool counter: false
            function reload(){
                // with sourceSize you can change resolution taken from source
                // Changing id is necessary to tell the image provider that new frame is requested otherwise it brings the same frame
                counter = !counter
                source = "image://imProvider/image" + counter
            }
        }
    }
    Button{
        id: start
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.topMargin: 10
        width: 60
        height:20
        text: "Start"
        onClicked:{
            streamer.start()
        }

    }

    Button{
        id: done
        anchors.left: start.left
        anchors.top: start.bottom
        anchors.topMargin: 10
        width: 60
        height:20
        text: "Stop"
        onClicked:{
            streamer.doneThread()
        }

    }
    Rectangle{
        width: 100
        height: 20
        anchors.left: start.right
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.topMargin: 10
        border.color: "black"
        border.width: 2
    TextInput{
        id: textInput
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "Enter source"
        onAccepted: {
            streamer.doneThread()
            streamer.setSource(textInput.text)
            streamer.start()
        }

    }

    }

    // Connection is made to fetch the signal invoke
    Connections{
        target: imageprovider
        function onFrameUpdated1(){
            improvid.reload()
        }
    }

}
