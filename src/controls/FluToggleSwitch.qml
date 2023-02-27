﻿import QtQuick 2.0
import QtQuick.Controls 2.0

Switch {
    id: root
    property color checkedColor: "#0064B0"
    signal clicked2
    width: 40
    implicitWidth: 40
    height: 20
    implicitHeight: 20
    checkable: false
    indicator: Rectangle {
        width: root.width
        height: root.height
        radius: height / 2
        color: {
            if(FluApp.isDark){
                if(root.checked){
                    return checkedColor
                }
                if(switch_mouse.containsMouse){
                    return "#3E3E3C"
                }
                return "#323232"
            }else{
                if(switch_mouse.containsMouse){
                    return "#F4F4F4"
                }
                return root.checked ? checkedColor : "white"
            }
        }
        border.width: 1
        border.color: root.checked ? checkedColor : "#666666"

        Rectangle {
            x:  root.checked ? root.implicitWidth  - width - 4 : 4
            width:  root.height - 8
            height: root.height - 8
            radius: width / 2
            scale: switch_mouse.containsMouse ? 1.2 : 1.0
            anchors.verticalCenter: parent.verticalCenter
            color: root.checked ? "#FFFFFF" : "#666666"
//            border.color: "#D5D5D5"
            Behavior on x {
                NumberAnimation { duration: 200 }
            }
        }
    }
    MouseArea{
        id:switch_mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.clicked2()
        }
    }
}