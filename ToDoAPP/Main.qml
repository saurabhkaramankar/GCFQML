import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import Popup
import "Utils"

Window {
    id: root
    width: 400
    height: 600
    visible: true
    title: qsTr("ToDo App")
    color: "#1e1e1e"

    ColumnLayout{
        anchors{
            fill: parent
            margins: 10
            topMargin: 30
            bottomMargin: 30
        }

        spacing: 20

        CustomTextField {
            // Layout.alignment: Qt.AlignHCenter
            // Layout.preferredHeight: 40
            // Layout.preferredWidth: 250
            Layout.fillWidth: true
            Layout.leftMargin: 16
            Layout.rightMargin: 16
            Layout.preferredHeight: 40
        }

        RowLayout{
            Layout.fillWidth: true
            Layout.preferredHeight: 20
            Layout.preferredWidth: 250

            spacing: 5

            Text{
                text: BackenedHelper.currentDay

                font{
                    pointSize: 36
                    weight: Font.Medium
                }
                color: "#fff"
            }

            ColumnLayout{

                spacing: 0

                Text{
                    text: BackenedHelper.currentMonth
                    font{
                        pointSize: 14
                        weight: Font.Medium
                    }
                    color: "#ddd"
                }

                Text{
                    text: BackenedHelper.currentYear
                    font{
                        pointSize: 12
                        weight: Font.Medium
                    }
                    color: "#aaa"
                }
            }

            Item {
                Layout.fillWidth : true
            }

            Text{
                text: BackenedHelper.currentDayOfWeek
                font{
                    pointSize: 12
                    weight: Font.Medium
                }
                color: "#aaa"
            }

        }


        ListView {
            id: todoList

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.leftMargin: 16
            Layout.rightMargin: 16

            Layout.preferredHeight: 40

            model: todoModel
            delegate: todoDelegate

            spacing: 8
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            ScrollBar.vertical: CustomScrollBar{}
        }


        Button{
            id:addBthHover
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 40
            leftPadding: 20
            rightPadding: 20

            contentItem: Text{
                text:  "Add Task"
                font.pointSize: 12
                color: "#fff"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            background: Rectangle{
                anchors.fill: parent
                // color: "#2ba84a"
                color: addBthHover.hovered ? Qt.darker("#2ba84a",1.1): "#2ba84a"
                radius: 10
            }


            onClicked: {
                todoModel.append({
                                 task: "New Task" + todoModel.count+1
                                 })

                notificationPopup.showPopup("Item Added Successfully")
            }
        }


    }

    Component{
        id: todoDelegate
        Rectangle{
            required property string task
            required property int index

            width: todoList.width
            height: 50
            color: "#363636"
            radius: 12

            RowLayout{
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter

                Text{
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    text: task
                    font.pointSize: 12
                    color: "#fafafa"
                }

                Image {
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20
                    Layout.rightMargin: 10
                    Layout.alignment: Qt.AlignVCenter

                    source: "qrc:/Resources/edit1.png"

                    MouseArea{
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: {
                          editPopup.showPopup(task,index)
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20
                    Layout.rightMargin: 10
                    Layout.alignment: Qt.AlignVCenter

                    source: "qrc:/Resources/delete.png"

                    MouseArea{
                        cursorShape: Qt.PointingHandCursor
                        anchors.fill: parent
                        onClicked: {
                          todoModel.remove(index)
                            notificationPopup.showPopup("Item Deleted Successfully")
                        }
                    }
                }

            }
        }
    }

    ListModel{
        id: todoModel
        ListElement{
            task: "Finish the lecture"

        }
        ListElement{
            task: "Code on my own"

        }
        ListElement{
            task: "Design UI/UX"

        }
        ListElement{
            task: "Learn DBMS"

        }
    }

    AppPopup{
        id:notificationPopup
        x:root.width/2 - width/2
        y:30
        // popupText: qsTr("Opened the Popup")

    }

    EditPopup{
        id: editPopup
        anchors.centerIn: parent

        onUpdateListText: function(newText,index)
        {
            todoModel.set(index, {task:newText})
        }
    }
}
