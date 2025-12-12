import QtQuick
import QtQuick.Controls.Basic


TextField {

    id:control

    placeholderText: qsTr("Search")

    color: "#fafafa"

    placeholderTextColor: "#777"

    leftPadding: 32
    rightPadding: 16


    background: Rectangle{
        color: "#363636"
        radius: control.height/2
    }

    Image{
        width: 12.5
        height: width
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 4
        anchors.left: parent.left
        anchors.leftMargin: 16
        source: "qrc:/Resources/white-search-icon.png"

        opacity: control.text ? 1 : 0.5
    }
}
