import QtQuick
import QtQuick.Window

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    color: "#202020"

    Rectangle{
        id: myRect
        width: parent.width - 150
        height: parent.height - 150
        anchors.centerIn: parent
        color: "#90ee90"


        Behavior on width {
            NumberAnimation {
               duration: 300

            }
        }

        Behavior on height {
            NumberAnimation{
                duration: 300
            }
        }
    }
}
