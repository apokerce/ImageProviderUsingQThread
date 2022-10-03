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
    color: "#202020"


    Rectangle{
        id: imagerect
        anchors.verticalCenter: parent.verticalCenter
        x: 85

        width: mainScreen.width - 130
        height:mainScreen.height - 130
        border.color: "black"
        color: "#202020"
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
        MouseArea{
            anchors.fill: parent
            onClicked: fileSubMenu.visible = false
        }

    }

    // A transparent rectangle is created so that if user click anywhere in the screen the menu will disappear
    // Z order (consider as hiearchy) chosen as -1 not to block buttons and text inputs
    Rectangle{
        id: forUnclicking
        z: -1
        width: parent.width
        height: parent.height
        color: "transparent"
        MouseArea{
            anchors.fill: parent
            onClicked: fileSubMenu.visible = false
        }
    }

    Rectangle{
        id: topMenu
        height:24
        width: parent.width
        color: "#515151"
        border.color: "black"
        Button{
            id: menuFile
            highlighted: true
            width: 30
            height:20
            Text{ text: qsTr("F")
                color: "white"
                font.pixelSize: 13
                font.underline: true
                font.family:"Arial"
                font.bold: true
                x:4
                anchors.verticalCenter: parent.verticalCenter
            }
            Text{ text: qsTr("ile")
                color: "white"
                font.pixelSize: 13
                font.family:"Arial"
                x:12
                font.bold: true
                anchors.verticalCenter: parent.verticalCenter
            }
            anchors.top: topMenu.top
            anchors.left: topMenu.left
            anchors.topMargin: 3
            anchors.leftMargin: 10
            background: Rectangle{
                id: startRect
                color: "#515151"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                property bool hovered: false
                onEntered:{ hovered = true ; startRect.color = "#707070"}
                onExited: { hovered = false ; startRect.color = "#515151"}
                onClicked: {
                    fileSubMenu.visible = true
                }
            }

        }
        Button{
            id: menuEdit
            highlighted: true
            width: 30
            height:20
            Text{ text: qsTr("E")
                color: "white"
                font.pixelSize: 13
                font.underline: true
                font.family:"Arial"
                font.bold: true
                x:4
                anchors.verticalCenter: parent.verticalCenter
            }
            Text{ text: qsTr("dit")
                color: "white"
                font.pixelSize: 13
                font.family:"Arial"
                x:12
                font.bold: true
                anchors.verticalCenter: parent.verticalCenter
            }
            anchors.top: topMenu.top
            anchors.left: menuFile.right
            anchors.topMargin: 3
            anchors.leftMargin: 4
            background: Rectangle{
                id: editRect
                color: "#515151"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                property bool hovered: false
                onEntered:{ hovered = true ; editRect.color = "#707070"}
                onExited: { hovered = false ; editRect.color = "#515151"}
            }
        }
        Rectangle{
            id: fileSubMenu
            anchors.top: menuFile.bottom
            anchors.left: menuFile.left
            width: mainScreen.width/4

            height: 70
            visible:false
            border.color: "black"
            border.width: 1
            color:"#515151"
            Button{
                id: startProcess
                highlighted: true
                width: parent.width - 4
                x:2
                y:2
                height:20
                Text{ text: qsTr("S")
                    color: "white"
                    font.pixelSize: 13
                    font.underline: true
                    font.family:"Arial"
                    x:4
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text{ text: qsTr("tart...")
                    color: "white"
                    font.pixelSize: 13
                    font.family:"Arial"
                    x:12
                    anchors.verticalCenter: parent.verticalCenter
                }
                anchors.topMargin: 3
                anchors.leftMargin: 10
                background: Rectangle{
                    id: startRectt
                    color: "#515151"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    property bool hovered: false
                    onEntered:{ hovered = true ; startRectt.color = "#707070"}
                    onExited: { hovered = false ; startRectt.color = "#515151"}
                    onClicked: {streamer.start(); fileSubMenu.visible = false}

                }

            }
            Button{
                id: stopProcess
                highlighted: true
                width: parent.width - 4
                x:2
                y:2
                height:20
                Text{ text: qsTr("S")
                    color: "white"
                    font.pixelSize: 13
                    font.underline: true
                    font.family:"Arial"
                    x:4
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text{ text: qsTr("top...")
                    color: "white"
                    font.pixelSize: 13
                    font.family:"Arial"
                    x:12
                    anchors.verticalCenter: parent.verticalCenter
                }
                anchors.top: startProcess.bottom
                anchors.topMargin: 3
                anchors.leftMargin: 10
                background: Rectangle{
                    id: stopRectt
                    color: "#515151"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    property bool hovered: false
                    onEntered:{ hovered = true ; stopRectt.color = "#707070"}
                    onExited: { hovered = false ; stopRectt.color = "#515151"}
                    onClicked: {streamer.doneThread(); fileSubMenu.visible = false}

                }
            }
            Rectangle{
                id: seperator
                width: fileSubMenu.width
                height: 1
                color:"black"
                anchors.top: stopProcess.bottom
            }
            Button{
                id: quit
                highlighted: true
                width: parent.width - 4
                x:2
                y:2
                height:20
                Text{ text: qsTr("E")
                    color: "white"
                    font.pixelSize: 13
                    font.underline: true
                    font.family:"Arial"
                    x:4
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text{ text: qsTr("xit...")
                    color: "white"
                    font.pixelSize: 13
                    font.family:"Arial"
                    x:12
                    anchors.verticalCenter: parent.verticalCenter
                }
                anchors.top: seperator.bottom
                anchors.topMargin: 3
                anchors.leftMargin: 10
                background: Rectangle{
                    id: exitRectt
                    color: "#515151"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    property bool hovered: false
                    onEntered:{ hovered = true ; exitRectt.color = "#707070"}
                    onExited: { hovered = false ; exitRectt.color = "#515151"}
                    onClicked: Qt.quit()

                }
            }

        }
    }

    Rectangle {
        id: leftMenu
        width:47
        z: -1
        x:-2
        y:23
        color: "#515151"
        border.color: "black"
        height: parent.height +4

        Rectangle{
            id: playButton
            x:4.5
            y:7
            width:40
            height:40
            color: "transparent"

            Image{
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "icons/play_button1.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: streamer.start()
            }
        }

        Rectangle{
            id: stopButton
            x:4.5
            anchors.topMargin: 5
            anchors.top: playButton.bottom
            width:40
            height:40
            color: "transparent"

            Image{
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "icons/stop.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: streamer.doneThread()
            }
        }

        Rectangle{
            visible: true
            width: 100
            height: 20
            anchors.left: leftMenu.right
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 10
            border.color: "black"
            border.width: 2
            color: "#515151"
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

    }

    // Connection is made to fetch the signal invoke
    Connections{
        target: imageprovider
        function onFrameUpdated1(){
            improvid.reload()
        }
    }

}
