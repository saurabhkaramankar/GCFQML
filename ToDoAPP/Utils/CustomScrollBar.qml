import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Material

T.ScrollBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)


    interactive: true
    policy: ScrollBar.AsNeeded
    padding: control.interactive ? 1 : 2
    hoverEnabled: true
    visible: control.policy !== T.ScrollBar.AlwaysOff
    minimumSize: 0.1

    contentItem: Rectangle {
        implicitWidth:  4
        implicitHeight: control.interactive ? 13 : 4

        color: control.pressed ? "#bbb" : control.interactive || control.hovered ? "#aaa" : "#taa"
        // color: control.hovered ? "#fafafa" :"#aaa"
        opacity: 0.0
    }

    background: Rectangle {

     color: "transparent"

    }

    states: State {
        name: "active"
        when: control.policy === T.ScrollBar.AlwaysOn || (control.active && control.size < 1.0)
    }

    transitions: [
        Transition {
            to: "active"
            NumberAnimation { targets: [control.contentItem, control.background]; property: "opacity"; to: 1.0 }
        },
        Transition {
            from: "active"
            SequentialAnimation {
                PropertyAction{ targets: [control.contentItem, control.background]; property: "opacity"; value: 1.0 }
                PauseAnimation { duration: 0 }
                NumberAnimation {
                    targets: [control.contentItem, control.background];
                    property: "opacity";
                    to: 0.0
                    duration: 100
                }
            }
        }
    ]
}
