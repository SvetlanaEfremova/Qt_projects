import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Make transition")
    Rectangle {
        id: scene
        anchors.fill: parent
        Rectangle {
            id: leftRectangle
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    circle.x += 30
                    if ((circle.x + 2 * circle.radius) >= rightRectangle.x)
                        scene.state = "leftState"
                    else
                        scene.state = "otherState"
                }
            }
            Text {
                text: "move"
                font.pointSize: 12
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: rightRectangle
            x: 450
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "leftState"
            }
            Text {
                text: "return"
                font.pointSize: 12
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: circle
            color: "blue"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2
        }
        states: [
            State {
                name: "leftState"
                PropertyChanges {
                    target: circle
                    x: leftRectangle.x + 5
                }
            },
            State {
                name: "otherState"
                PropertyChanges {
                    target: circle
                    x: circle.x
                }
            }
        ]
        transitions: [
            Transition {
                from: "otherState"
                to: "leftState"
                NumberAnimation {
                    properties: "x,y"
                    duration: 2000
                    easing.type: Easing.OutExpo;
                }
            }
        ]
    }
}

