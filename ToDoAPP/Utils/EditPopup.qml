import QtQuick
import QtQuick.Controls.Material
import QtQuick.Templates as T
import QtQuick.Controls.Material.impl
import QtQuick.Layouts

Popup{
    id: control

   //proprty binded to textfiled if it changes text also changes
    property string popupText: ""

    property int index: -1

    signal updateListText(string newText,int index)

    width: 300
    height: 150

    closePolicy:Popup.NoAutoClose
    padding: 30
    modal: true

    background: Rectangle{
        radius: control.height/4
        color: "#1e1e1e"
    }


    ColumnLayout{
        anchors.fill: parent
        spacing: 16

        TextField{
            id: editText

            Layout.fillWidth: true

            color: "#fafafa"

            text: control.popupText

            placeholderTextColor: "#777"

            leftPadding: 32

            rightPadding: 16

            background: Rectangle{

                color: "#363636"
                radius: control.height/2
            }
        }

        Button{
            id: saveBtn
            Layout.alignment: Qt.AlignHCenter
            implicitHeight: 40
            leftPadding: 20
            rightPadding: 20

            contentItem: Text{
                text:  "Update Task"
                font.pointSize: 12
                color: "#fff"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            background: Rectangle{
                anchors.fill: parent
                color: addBthHover.hovered ? Qt.darker("#2ba84a",1.1): "#2ba84a"
                radius: 10
            }


            onClicked: {
              updateListText(editText.text,control.index);
              control.close()

             }



        }

        Item{
            Layout.fillWidth: true
        }
    }



    function showPopup(displayText,index)
    {
        control.popupText = displayText
        control.index = index

        control.open()
    }
}
