import QtQuick
import QtQuick.Controls.Material
import QtQuick.Templates as T
import QtQuick.Controls.Material.impl
import QtQuick.Layouts

Popup{
    id: control

    property string popupText: ""
    width: 300
    height: 50
    closePolicy:Popup.NoAutoClose
    padding: 5

    background: Rectangle{
        radius: control.height/4
        color: Qt.lighter("#eaf7ee",1.4)
        border.width: 2
        border.color: "#cee4d2"
    }


    RowLayout{
        anchors.fill: parent
        spacing: 16

        Rectangle{
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            color: "#37b359"
            radius: height/3


            Rectangle{
                anchors.centerIn: parent

                width: 36
                height: 36
                radius: width/2
                color: "#fff"

                Image{
                    width: 24
                    height: 24
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/Resources/check.png"
                }

            }
        }

        Text{
            text: control.popupText
            font{
                pointSize:12.5
                weight: font.DemiBold
            }
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            // horizontalAlignment: Text.AlignLeft
            color: "#1a1a1a"
        }

        Item{
            Layout.fillWidth: true
        }
    }


    onAboutToShow: popupTimer.start()


    Timer{
        id: popupTimer
        interval: 3000
        repeat: false
        onTriggered: control.close()
    }

    function showPopup(displayText)
    {
        control.popupText = displayText
        control.open()
    }
}


