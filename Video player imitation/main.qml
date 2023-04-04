import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Player")
    color:"#C0C0C0"
    Rectangle {
        id: screen
        Text {
            id: status
            text: ""
            color:"#FFFFFF"
            font.pointSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        width: 530
        height: 300
        color:"#000000"
        border.color: "#000000"
        border.width: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -50
    }
    Button {
        contentItem: Text {
               text: "▶️"
               color:"#0000FF"
               font.pointSize: 25
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter

           }
        background: Rectangle {
            border.width: 2
            border.color: "#000000"
            radius: 8
            color:"#999999"

        }
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -200
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 140
        width: 50
        height: 50
        onClicked: {
            progressbar.indeterminate = true
            screen.color = "#999999"
            status.text = "(playing)"
        }
    }
    Button {
        text:"⏸️"
        background: Rectangle {
            border.width: 2
            border.color: "#000000"
            radius: 8
            color:"#999999"
        }
        font.pointSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -100
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 140
        width: 50
        height: 50
        onClicked: {
            progressbar.indeterminate = false
            status.text = "(paused)"
        }
    }
    Button {
        text: "⏹"
        background: Rectangle {
            border.width: 2
            border.color: "#000000"
            radius: 8
            color:"#999999"
        }
        font.pointSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 140
        width: 50
        height: 50
        onClicked: {
            progressbar.indeterminate = false
            screen.color = "#000000"
            status.text = "(stopped)"
        }
    }
    Button {
        text:"⏪️"
        background: Rectangle {
            border.width: 2
            border.color: "#000000"
            radius: 8
            color:"#999999"
        }
        font.pointSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 140
        width: 50
        height: 50
        onClicked: {
            progressbar.indeterminate = true
            screen.color = "#999999"
            status.text = "(rewinding backward)"
        }
    }
    Button {
        text:"⏩️"
        background: Rectangle {
            border.width: 2
            border.color: "#000000"
            radius: 8
            color:"#999999"

        }
        font.pointSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 200
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 140
        width: 50
        height: 50
        onClicked: {
            progressbar.indeterminate = true
            screen.color = "#999999"
            status.text = "(rewinding forward)"
        }
    }
    ProgressBar {
        id: progressbar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 200
        width: 500
        height: 25
    }
}
